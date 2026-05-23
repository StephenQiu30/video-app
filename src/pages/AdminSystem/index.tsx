import { PageContainer, ProTable } from '@ant-design/pro-components';
import { Tag } from 'antd';
import React from 'react';

import { buildHealthRows, type HealthRow } from '@/services/admin-console';
import { healthHealthGet, readyReadyGet } from '@/services/video/health';

const statusColor: Record<HealthRow['status'], string> = {
  ok: 'green',
  degraded: 'gold',
  failed: 'red',
};

const statusText: Record<HealthRow['status'], string> = {
  ok: '正常',
  degraded: '降级',
  failed: '异常',
};

const AdminSystemPage: React.FC = () => {
  return (
    <PageContainer title="系统状态" subTitle="查看后端健康检查与运行依赖状态">
      <ProTable<HealthRow>
        rowKey="key"
        search={false}
        options={false}
        pagination={false}
        request={async () => {
          const [health, readiness] = await Promise.allSettled([
            healthHealthGet(),
            readyReadyGet(),
          ]);
          const rows = buildHealthRows(
            health.status === 'fulfilled' ? health.value : undefined,
            readiness.status === 'fulfilled' ? readiness.value : undefined,
            {
              health:
                health.status === 'rejected'
                  ? health.reason?.message || '请求 /health 失败'
                  : undefined,
              readiness:
                readiness.status === 'rejected'
                  ? readiness.reason?.message || '请求 /ready 失败'
                  : undefined,
            },
          );
          return { data: rows, success: true, total: rows.length };
        }}
        columns={[
          { title: '检查项', dataIndex: 'name' },
          {
            title: '状态',
            dataIndex: 'status',
            width: 120,
            render: (_, row) => (
              <Tag color={statusColor[row.status]}>{statusText[row.status]}</Tag>
            ),
          },
          { title: '诊断信息', dataIndex: 'message', ellipsis: true },
        ]}
      />
    </PageContainer>
  );
};

export default AdminSystemPage;
