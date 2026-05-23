import { PageContainer, ProCard } from '@ant-design/pro-components';
import { Descriptions, Tag } from 'antd';
import React from 'react';

const AccountPage: React.FC = () => {
  return (
    <PageContainer title="账号中心" subTitle="查看账号资料、额度和文件保留策略">
      <ProCard className="video-page-card">
        <Descriptions column={{ xs: 1, md: 2 }} bordered>
          <Descriptions.Item label="邮箱">admin@example.com</Descriptions.Item>
          <Descriptions.Item label="账号状态"><Tag color="green">正常</Tag></Descriptions.Item>
          <Descriptions.Item label="每日任务额度">20</Descriptions.Item>
          <Descriptions.Item label="并发额度">1</Descriptions.Item>
          <Descriptions.Item label="最大文件大小">2GB</Descriptions.Item>
          <Descriptions.Item label="文件保留时间">24 小时</Descriptions.Item>
        </Descriptions>
      </ProCard>
    </PageContainer>
  );
};

export default AccountPage;
