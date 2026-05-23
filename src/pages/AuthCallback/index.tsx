import { LoadingOutlined } from '@ant-design/icons';
import { history, useModel } from '@umijs/max';
import { Result } from 'antd';
import React, { useEffect } from 'react';

import {
  consumeOAuthTokenFromSearch,
  fetchCurrentUser,
} from '@/services/auth';

const AuthCallbackPage: React.FC = () => {
  const { setInitialState } = useModel('@@initialState') as unknown as {
    setInitialState: (
      updater: (state: any) => Record<string, unknown>,
    ) => Promise<void>;
  };

  useEffect(() => {
    const run = async () => {
      const token = consumeOAuthTokenFromSearch(history.location.search);
      if (!token) {
        history.replace('/user/login');
        return;
      }

      try {
        const currentUser = await fetchCurrentUser();
        await setInitialState((state) => ({ ...state, currentUser }));
        history.replace('/parser');
      } catch {
        history.replace('/user/login');
      }
    };

    void run();
  }, [setInitialState]);

  return (
    <Result
      icon={<LoadingOutlined />}
      title="正在完成登录"
      subTitle="请稍候，系统正在初始化账号信息。"
    />
  );
};

export default AuthCallbackPage;
