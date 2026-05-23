import { PageContainer, ProTable } from '@ant-design/pro-components';
import { Tag } from 'antd';
import React from 'react';

const AdminPlatformsPage: React.FC = () => {
  return (
    <PageContainer title="平台能力" subTitle="展示当前支持的视频平台与合规边界">
      <ProTable
        rowKey="name"
        search={false}
        options={false}
        dataSource={[
          { name: 'B站', category: '主流视频', status: '规划接入' },
          { name: '抖音', category: '国内短视频', status: '规划接入' },
          { name: '快手', category: '国内短视频', status: '规划接入' },
        ]}
        columns={[
          { title: '平台', dataIndex: 'name' },
          { title: '分类', dataIndex: 'category' },
          { title: '状态', dataIndex: 'status', render: (_, row) => <Tag color="blue">{String(row.status)}</Tag> },
        ]}
      />
    </PageContainer>
  );
};

export default AdminPlatformsPage;
