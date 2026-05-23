import { PageContainer, ProCard } from '@ant-design/pro-components';
import { Statistic } from 'antd';
import React from 'react';

const AdminTasksPage: React.FC = () => {
  return (
    <PageContainer title="任务监控" subTitle="查看全局任务状态和队列概览">
      <ProCard gutter={16} ghost>
        <ProCard className="video-page-card"><Statistic title="活跃任务" value={0} /></ProCard>
        <ProCard className="video-page-card"><Statistic title="队列深度" value={0} /></ProCard>
        <ProCard className="video-page-card"><Statistic title="失败任务" value={0} /></ProCard>
      </ProCard>
    </PageContainer>
  );
};

export default AdminTasksPage;
