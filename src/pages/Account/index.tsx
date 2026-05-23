import { PageContainer, ProCard } from '@ant-design/pro-components';
import { useModel } from '@umijs/max';
import { Descriptions, Empty, Tag } from 'antd';
import React from 'react';

import { formatBytes } from '@/services/workspace';

const AccountPage: React.FC = () => {
  const { initialState } = useModel('@@initialState') as unknown as {
    initialState?: { currentUser?: API.UserRead };
  };
  const user = initialState?.currentUser;

  return (
    <PageContainer title="账号中心" subTitle="查看账号资料、额度和文件保留策略">
      <ProCard className="video-page-card">
        {!user ? (
          <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} description="暂无账号信息" />
        ) : (
          <Descriptions column={{ xs: 1, md: 2 }} bordered>
            <Descriptions.Item label="邮箱">{user.email}</Descriptions.Item>
            <Descriptions.Item label="显示名">
              {user.display_name || '-'}
            </Descriptions.Item>
            <Descriptions.Item label="账号状态">
              <Tag color={user.is_active ? 'green' : 'red'}>
                {user.is_active ? '正常' : '停用'}
              </Tag>
            </Descriptions.Item>
            <Descriptions.Item label="每日任务额度">
              {user.daily_task_quota}
            </Descriptions.Item>
            <Descriptions.Item label="并发额度">
              {user.concurrent_task_quota}
            </Descriptions.Item>
            <Descriptions.Item label="最大文件大小">
              {formatBytes(user.max_file_size_bytes)}
            </Descriptions.Item>
            <Descriptions.Item label="存储额度">
              {formatBytes(user.storage_quota_bytes)}
            </Descriptions.Item>
            <Descriptions.Item label="文件保留时间">
              {user.file_retention_hours} 小时
            </Descriptions.Item>
          </Descriptions>
        )}
      </ProCard>
    </PageContainer>
  );
};

export default AccountPage;
