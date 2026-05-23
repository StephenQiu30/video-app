import { PageContainer, ProTable } from '@ant-design/pro-components';
import { Tag } from 'antd';
import React from 'react';

import {
  quotaSummary,
  userRoleLabel,
  userStatusColor,
  userStatusLabel,
} from '@/services/admin-console';
import { listUsersApiAdminUsersGet } from '@/services/video/admin';

const AdminUsersPage: React.FC = () => {
  return (
    <PageContainer title="用户管理" subTitle="查看用户状态、角色和额度">
      <ProTable<API.UserRead>
        rowKey="id"
        options={false}
        pagination={{ pageSize: 10 }}
        scroll={{ x: 960 }}
        request={async (params) => {
          const limit = params.pageSize || 10;
          const offset = ((params.current || 1) - 1) * limit;
          const users = await listUsersApiAdminUsersGet({ limit, offset });
          const email = String(params.email || '').trim().toLowerCase();
          const data = email
            ? users.filter((item) => item.email.toLowerCase().includes(email))
            : users;

          return { data, success: true, total: data.length };
        }}
        columns={[
          { title: '邮箱', dataIndex: 'email' },
          {
            title: '显示名',
            dataIndex: 'display_name',
            search: false,
            renderText: (value) => value || '-',
          },
          {
            title: '角色',
            dataIndex: 'is_admin',
            search: false,
            width: 120,
            render: (_, row) => <Tag color={row.is_admin ? 'blue' : 'default'}>{userRoleLabel(row)}</Tag>,
          },
          {
            title: '状态',
            dataIndex: 'is_active',
            search: false,
            width: 120,
            render: (_, row) => (
              <Tag color={userStatusColor(row)}>{userStatusLabel(row)}</Tag>
            ),
          },
          {
            title: '额度',
            dataIndex: 'daily_task_quota',
            search: false,
            ellipsis: true,
            render: (_, row) => quotaSummary(row),
          },
          {
            title: '创建时间',
            dataIndex: 'created_at',
            valueType: 'dateTime',
            search: false,
            width: 180,
          },
        ]}
      />
    </PageContainer>
  );
};

export default AdminUsersPage;
