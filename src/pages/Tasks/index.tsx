import { PageContainer, ProTable } from '@ant-design/pro-components';
import { history } from '@umijs/max';
import { Button, Progress, Tag } from 'antd';
import React from 'react';

import { listTasksApiTasksGet } from '@/services/video/tasks';
import {
  taskStateColor,
  taskStateLabel,
  taskStateOptions,
  taskTitle,
} from '@/services/workspace';

const TasksPage: React.FC = () => {
  return (
    <PageContainer title="下载任务" subTitle="查看下载进度、失败原因和任务详情">
      <ProTable<API.TaskRead>
        rowKey="id"
        options={false}
        pagination={{ pageSize: 10 }}
        scroll={{ x: 860 }}
        request={async (params) => {
          const state = params.state === 'all' ? undefined : params.state;
          const data = await listTasksApiTasksGet({
            state: state as string | undefined,
            limit: 100,
          });
          return { data, success: true, total: data.length };
        }}
        columns={[
          {
            title: '状态',
            dataIndex: 'state',
            valueType: 'select',
            initialValue: 'all',
            valueEnum: Object.fromEntries(
              taskStateOptions.map((option) => [
                option.value,
                { text: option.label },
              ]),
            ),
            width: 120,
            render: (_, row) => (
              <Tag color={taskStateColor(row.state)}>
                {taskStateLabel(row.state)}
              </Tag>
            ),
          },
          {
            title: '标题',
            dataIndex: 'title',
            search: false,
            ellipsis: true,
            render: (_, row) => taskTitle(row),
          },
          {
            title: '格式',
            dataIndex: 'format_label',
            search: false,
            width: 140,
            renderText: (value) => value || '-',
          },
          {
            title: '进度',
            dataIndex: 'progress',
            search: false,
            width: 180,
            render: (_, row) => <Progress percent={row.progress} size="small" />,
          },
          {
            title: '更新时间',
            dataIndex: 'updated_at',
            valueType: 'dateTime',
            search: false,
            width: 180,
          },
          {
            title: '操作',
            valueType: 'option',
            width: 96,
            render: (_, row) => (
              <Button type="link" onClick={() => history.push(`/tasks/${row.id}`)}>
                详情
              </Button>
            ),
          },
        ]}
      />
    </PageContainer>
  );
};

export default TasksPage;
