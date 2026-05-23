import { CloudDownloadOutlined, LinkOutlined, SafetyCertificateOutlined } from '@ant-design/icons';
import { PageContainer, ProCard, ProForm, ProFormText } from '@ant-design/pro-components';
import { Button, Space, Tag, Typography } from 'antd';
import React from 'react';

const ParserPage: React.FC = () => {
  return (
    <PageContainer
      title="解析下载"
      subTitle="粘贴公开视频链接，解析格式后创建下载任务"
      extra={<Button type="primary" icon={<CloudDownloadOutlined />}>开始解析</Button>}
    >
      <ProCard className="video-page-card" split="vertical" gutter={24}>
        <ProCard colSpan="62%" ghost>
          <ProForm
            layout="vertical"
            submitter={{
              searchConfig: { submitText: '解析链接' },
              render: (_, dom) => dom.pop(),
            }}
          >
            <ProFormText
              name="url"
              label="视频链接"
              placeholder="粘贴 B 站、抖音、快手等公开视频分享链接"
              fieldProps={{ prefix: <LinkOutlined /> }}
              rules={[{ required: true, message: '请输入视频链接' }]}
            />
          </ProForm>
          <Space wrap>
            <Tag color="blue">公开链接解析</Tag>
            <Tag color="green">格式选择</Tag>
            <Tag color="gold">任务队列</Tag>
            <Tag color="purple">PDF 报告</Tag>
          </Space>
        </ProCard>
        <ProCard title="能力边界" colSpan="38%">
          <Space orientation="vertical" size={12}>
            <Typography.Text>
              <SafetyCertificateOutlined style={{ color: '#1677ff', marginRight: 8 }} />
              仅处理用户有权保存的公开或授权内容。
            </Typography.Text>
            <Typography.Text type="secondary">
              不提供 DRM、付费墙或平台访问控制绕过能力。
            </Typography.Text>
          </Space>
        </ProCard>
      </ProCard>
    </PageContainer>
  );
};

export default ParserPage;
