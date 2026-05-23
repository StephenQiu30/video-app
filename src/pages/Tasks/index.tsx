import { PageContainer, ProTable } from '@ant-design/pro-components';
import { Button, Progress, Tag } from 'antd';
import React from 'react';

type TaskRow = {
  id: string;
  title: string;
  state: string;
  progress: number;
  format: string;
  updatedAt: string;
};

const rows: TaskRow[] = [
  {
    id: 'demo-task',
    title: '示例任务：公开视频下载',
    state: '排队中',
    progress: 12,
    format: 'MP4 1080P',
    updatedAt: '刚刚',
  },
];

const TasksPage: React.FC = () => {
  return (
    <PageContainer title="下载任务" subTitle="查看下载进度、失败原因和任务详情">
      <ProTable<TaskRow>
        rowKey="id"
        search={false}
        options={false}
        dataSource={rows}
        columns={[
          { title: '标题', dataIndex: 'title' },
          { title: '格式', dataIndex: 'format', width: 140 },
          { title: '状态', dataIndex: 'state', width: 120, render: (_, row) => <Tag color="processing">{row.state}</Tag> },
          { title: '进度', dataIndex: 'progress', width: 180, render: (_, row) => <Progress percent={row.progress} size="small" /> },
          { title: '更新时间', dataIndex: 'updatedAt', width: 120 },
          { title: '操作', valueType: 'option', width: 100, render: () => <Button type="link">详情</Button> },
        ]}
      />
    </PageContainer>
  );
};

export default TasksPage;
