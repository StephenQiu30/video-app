import { LockOutlined, MailOutlined } from '@ant-design/icons';
import { LoginForm, ProFormText } from '@ant-design/pro-components';
import { useModel } from '@umijs/max';
import { App, Modal, Typography } from 'antd';
import React from 'react';

import { fetchCurrentUser, loginWithPassword } from '@/services/auth';

type InitialState = {
  currentUser?: API.UserRead;
  [key: string]: unknown;
};

type InitialStateModel = {
  setInitialState: (
    updater: (state?: InitialState) => InitialState,
  ) => Promise<void> | void;
};

export type AuthModalProps = {
  open: boolean;
  onCancel: () => void;
  onSuccess?: (currentUser: API.UserRead) => Promise<void> | void;
};

const AuthModal: React.FC<AuthModalProps> = ({ open, onCancel, onSuccess }) => {
  const { message } = App.useApp();
  const { setInitialState } = useModel(
    '@@initialState',
  ) as unknown as InitialStateModel;

  return (
    <Modal
      destroyOnHidden
      footer={null}
      onCancel={onCancel}
      open={open}
      title="登录"
      width={420}
    >
      <LoginForm
        contentStyle={{ minWidth: 0 }}
        submitter={{ searchConfig: { submitText: '登录' } }}
        onFinish={async (values) => {
          try {
            await loginWithPassword(values as API.UserLogin);
            const currentUser = await fetchCurrentUser();
            await setInitialState((state) => ({ ...state, currentUser }));
            await onSuccess?.(currentUser);
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
            autoComplete: 'email',
            prefix: <MailOutlined />,
            size: 'large',
          }}
          placeholder="邮箱"
          rules={[{ required: true, message: '请输入邮箱' }]}
        />
        <ProFormText.Password
          name="password"
          fieldProps={{
            autoComplete: 'current-password',
            prefix: <LockOutlined />,
            size: 'large',
          }}
          placeholder="密码"
          rules={[{ required: true, message: '请输入密码' }]}
        />
        <Typography.Text type="secondary">
          登录后可继续解析公开或已授权的视频内容。
        </Typography.Text>
      </LoginForm>
    </Modal>
  );
};

export default AuthModal;
