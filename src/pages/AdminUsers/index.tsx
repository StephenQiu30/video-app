import { PageContainer, ProTable } from '@ant-design/pro-components';
import { Tag } from 'antd';
import React from 'react';

const AdminUsersPage: React.FC = () => {
  return (
    <PageContainer title="用户管理" subTitle="查看用户状态、角色和额度">
      <ProTable
        rowKey="email"
        search={false}
        options={false}
        dataSource={[{ email: 'admin@example.com', role: '管理员', status: '正常' }]}
        columns={[
          { title: '邮箱', dataIndex: 'email' },
          { title: '角色', dataIndex: 'role' },
          { title: '状态', dataIndex: 'status', render: () => <Tag color="green">正常</Tag> },
        ]}
      />
    </PageContainer>
  );
};

export default AdminUsersPage;
