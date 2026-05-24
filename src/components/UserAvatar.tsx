import { LoginOutlined, LogoutOutlined, UserOutlined } from '@ant-design/icons';
import { history, useModel } from '@umijs/max';
import type { MenuProps } from 'antd';
import { Avatar, Button, Dropdown, Space } from 'antd';
import React from 'react';

import { authTokenStorage } from '@/services/auth';

type InitialStateModel = {
  initialState?: {
    currentUser?: API.UserRead;
  };
  setInitialState: (
    updater: (state?: { currentUser?: API.UserRead }) => {
      currentUser?: API.UserRead;
    },
  ) => void;
};

type UserAvatarProps = {
  onUserChange?: (currentUser?: API.UserRead) => void;
};

const UserAvatar: React.FC<UserAvatarProps> = ({ onUserChange }) => {
  const { initialState, setInitialState } = useModel(
    '@@initialState',
  ) as unknown as InitialStateModel;
  const currentUser = initialState?.currentUser;

  if (!currentUser) {
    return (
      <Button
        type="text"
        icon={<LoginOutlined />}
        onClick={() => history.push('/parser?login=1')}
      >
        登录
      </Button>
    );
  }

  const menuItems: MenuProps['items'] = [
    {
      key: 'account',
      icon: <UserOutlined />,
      label: '账号中心',
    },
    {
      type: 'divider',
    },
    {
      key: 'logout',
      icon: <LogoutOutlined />,
      label: '退出登录',
    },
  ];

  const onMenuClick: MenuProps['onClick'] = ({ key }) => {
    if (key === 'logout') {
      authTokenStorage.clear();
      setInitialState((state) => ({ ...state, currentUser: undefined }));
      onUserChange?.(undefined);
      history.push('/parser');
      return;
    }
    if (key === 'account') {
      history.push('/account');
    }
  };

  return (
    <Dropdown menu={{ items: menuItems, onClick: onMenuClick }} placement="bottomRight">
      <Space style={{ cursor: 'pointer' }}>
        <Avatar size="small" src={currentUser?.avatar_url} icon={<UserOutlined />} />
        <span>{currentUser.display_name || currentUser.email || '已登录用户'}</span>
      </Space>
    </Dropdown>
  );
};

export default UserAvatar;
