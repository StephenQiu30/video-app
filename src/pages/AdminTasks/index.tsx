import { PageContainer, ProCard, ProTable } from '@ant-design/pro-components';
import { Statistic, Tag, Typography } from 'antd';
import React, { useEffect, useState } from 'react';

import { getMetricsApiAdminMetricsGet } from '@/services/video/admin';
import { listTasksApiTasksGet } from '@/services/video/tasks';
import {
  formatBytes,
  taskStateColor,
  taskStateLabel,
  taskStateOptions,
  taskTitle,
} from '@/services/workspace';

const AdminTasksPage: React.FC = () => {
  const [metrics, setMetrics] = useState<API.AdminMetricsResponse>();

  useEffect(() => {
    void getMetricsApiAdminMetricsGet().then(setMetrics);
  }, []);

  return (
    <PageContainer title="任务监控" subTitle="查看全局任务状态和队列概览">
      <ProCard gutter={16} ghost>
        <ProCard className="video-page-card">
          <Statistic title="活跃任务" value={metrics?.active_tasks ?? '-'} />
        </ProCard>
        <ProCard className="video-page-card">
          <Statistic title="排队任务数" value={metrics?.queue_depth ?? '-'} />
        </ProCard>
        <ProCard className="video-page-card">
          <Statistic
            title="已用存储"
            value={formatBytes(metrics?.total_storage_bytes)}
          />
        </ProCard>
      </ProCard>

      <ProTable<API.TaskRead>
        rowKey="id"
        options={false}
        pagination={{ pageSize: 10 }}
        scroll={{ x: 1040 }}
        style={{ marginTop: 16 }}
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
            title: '任务',
            dataIndex: 'title',
            search: false,
            ellipsis: true,
            render: (_, row) => taskTitle(row),
          },
          {
            title: '失败原因',
            dataIndex: 'failure_reason',
            search: false,
            ellipsis: true,
            render: (_, row) => (
              <Typography.Text type={row.failure_reason ? 'danger' : 'secondary'}>
                {row.failure_reason || '-'}
              </Typography.Text>
            ),
          },
          {
            title: '格式',
            dataIndex: 'format_label',
            search: false,
            width: 140,
            renderText: (value) => value || '-',
          },
          {
            title: '更新时间',
            dataIndex: 'updated_at',
            valueType: 'dateTime',
            search: false,
            width: 180,
          },
        ]}
      />
    </PageContainer>
  );
};

export default AdminTasksPage;
