import type { Settings as LayoutSettings } from '@ant-design/pro-components';
import type {
  AxiosRequestConfig,
  RequestConfig,
  RunTimeLayoutConfig,
} from '@umijs/max';
import { App, Button } from 'antd';
import { history, Link } from '@umijs/max';
import React from 'react';

import { UserAvatar } from '@/components';
import {
  TOKEN_STORAGE_KEY,
  authTokenStorage,
  fetchCurrentUser,
} from '@/services/auth';
import defaultSettings from '../config/defaultSettings';
import './global.less';

const loginPath = '/user/login';
const authCallbackPath = '/auth';

export async function getInitialState(): Promise<{
  settings?: Partial<LayoutSettings>;
  currentUser?: API.UserRead;
  fetchUserInfo?: () => Promise<API.UserRead | undefined>;
}> {
  const fetchUserInfo = async () => {
    try {
      return await fetchCurrentUser();
    } catch {
      authTokenStorage.clear();
      return undefined;
    }
  };

  const pathname = history.location.pathname;
  const token = authTokenStorage.get();
  const shouldSkipFetch = [loginPath, authCallbackPath].includes(pathname);

  if (!token || shouldSkipFetch) {
    return {
      fetchUserInfo,
      settings: defaultSettings as Partial<LayoutSettings>,
    };
  }

  return {
    currentUser: await fetchUserInfo(),
    fetchUserInfo,
    settings: defaultSettings as Partial<LayoutSettings>,
  };
}

export const layout: RunTimeLayoutConfig = ({
  initialState,
  setInitialState,
}) => {
  return {
    actionsRender: () => [],
    avatarProps: {
      title:
        initialState?.currentUser?.display_name ||
        initialState?.currentUser?.email,
      render: () => <UserAvatar />,
    },
    footerRender: false,
    menuHeaderRender: undefined,
    menuItemRender: (item, dom) => {
      if (item.path) {
        return <Link to={item.path}>{dom}</Link>;
      }
      return dom;
    },
    onPageChange: () => {
      const { location } = history;
      const isPublicPath = [loginPath, authCallbackPath].includes(
        location.pathname,
      );
      if (!initialState?.currentUser && !isPublicPath) {
        history.replace(
          `${loginPath}?redirect=${encodeURIComponent(
            location.pathname + location.search + location.hash,
          )}`,
        );
      }
    },
    unAccessible: (
      <div style={{ padding: 48, textAlign: 'center' }}>
        <h2>无权限访问</h2>
        <p>当前账号没有访问该页面的权限。</p>
        <Button type="primary" onClick={() => history.push('/parser')}>
          返回解析下载
        </Button>
      </div>
    ),
    ...initialState?.settings,
    onMenuHeaderClick: () => history.push('/parser'),
    rightContentRender: () => (
      <UserAvatar
        onUserChange={(currentUser) =>
          setInitialState((state) => ({ ...state, currentUser }))
        }
      />
    ),
  };
};

export const request: RequestConfig = {
  baseURL: process.env.UMI_APP_API_BASE_URL || '',
  requestInterceptors: [
    (config: AxiosRequestConfig) => {
      const token = authTokenStorage.get();
      if (token) {
        config.headers = {
          ...config.headers,
          Authorization: `Bearer ${token}`,
        };
      }
      return config;
    },
  ],
  responseInterceptors: [
    [
      (response) => response,
      (error: any) => {
        if (error?.response?.status === 401) {
          localStorage.removeItem(TOKEN_STORAGE_KEY);
          if (!history.location.pathname.startsWith(loginPath)) {
            history.replace(loginPath);
          }
        }
        return Promise.reject(error);
      },
    ],
  ],
};

export function rootContainer(container: React.ReactNode) {
  return <App>{container}</App>;
}
