import { PageContainer, ProCard } from '@ant-design/pro-components';
import { List, Tag } from 'antd';
import React from 'react';

const checks = ['API /health', 'API /ready', 'OpenAPI 契约', '对象存储', '媒体工具'];

const AdminSystemPage: React.FC = () => {
  return (
    <PageContainer title="系统状态" subTitle="查看后端健康检查与运行依赖状态">
      <ProCard className="video-page-card">
        <List
          dataSource={checks}
          renderItem={(item) => (
            <List.Item actions={[<Tag color="default" key="pending">待接入</Tag>]}>
              {item}
            </List.Item>
          )}
        />
      </ProCard>
    </PageContainer>
  );
};

export default AdminSystemPage;
