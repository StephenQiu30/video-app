import { PageContainer, ProTable } from '@ant-design/pro-components';
import { Tag } from 'antd';
import React from 'react';

import {
  type PlatformCapabilityRow,
  platformCapabilityRows,
} from '@/services/admin-console';

const AdminPlatformsPage: React.FC = () => {
  return (
    <PageContainer title="平台能力" subTitle="展示当前支持的视频平台与合规边界">
      <ProTable<PlatformCapabilityRow>
        rowKey="id"
        search={false}
        options={false}
        pagination={false}
        dataSource={platformCapabilityRows}
        scroll={{ x: 980 }}
        columns={[
          { title: '平台', dataIndex: 'name' },
          { title: '分类', dataIndex: 'category', width: 140 },
          { title: '适配方式', dataIndex: 'adapter', width: 220 },
          {
            title: '状态',
            dataIndex: 'status',
            width: 120,
            render: (_, row) => <Tag color="blue">{row.status}</Tag>,
          },
          { title: '支持能力', dataIndex: 'capability', ellipsis: true },
          { title: '合规限制', dataIndex: 'compliance', ellipsis: true },
        ]}
      />
    </PageContainer>
  );
};

export default AdminPlatformsPage;
