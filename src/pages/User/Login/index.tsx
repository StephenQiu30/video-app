import { LockOutlined, MailOutlined } from '@ant-design/icons';
import {
  LoginForm,
  ProFormText,
} from '@ant-design/pro-components';
import { history, useModel } from '@umijs/max';
import { App, Typography } from 'antd';
import React from 'react';

import { fetchCurrentUser, loginWithPassword } from '@/services/auth';

const LoginPage: React.FC = () => {
  const { message } = App.useApp();
  const { setInitialState } = useModel('@@initialState') as unknown as {
    setInitialState: (
      updater: (state: any) => Record<string, unknown>,
    ) => Promise<void>;
  };

  return (
    <div className="video-login-shell">
      <LoginForm
        logo="/logo.svg"
        title="万能视频下载器"
        subTitle="登录后解析公开或授权视频内容"
        submitter={{ searchConfig: { submitText: '登录' } }}
        onFinish={async (values) => {
          try {
            await loginWithPassword(values as API.UserLogin);
            const currentUser = await fetchCurrentUser();
            await setInitialState((state) => ({ ...state, currentUser }));
            const redirect = new URLSearchParams(history.location.search).get(
              'redirect',
            );
            history.replace(redirect || '/parser');
            return true;
          } catch {
            message.error('登录失败，请检查邮箱和密码');
            return false;
          }
        }}
      >
        <ProFormText
          name="email"
          fieldProps={{
            size: 'large',
            prefix: <MailOutlined />,
            autoComplete: 'email',
          }}
          placeholder="邮箱"
          rules={[{ required: true, message: '请输入邮箱' }]}
        />
        <ProFormText.Password
          name="password"
          fieldProps={{
            size: 'large',
            prefix: <LockOutlined />,
            autoComplete: 'current-password',
          }}
          placeholder="密码"
          rules={[{ required: true, message: '请输入密码' }]}
        />
        <Typography.Text type="secondary">
          如需 GitHub OAuth，请从后端授权入口完成跳转。
        </Typography.Text>
      </LoginForm>
    </div>
  );
};

export default LoginPage;
