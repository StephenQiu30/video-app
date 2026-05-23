import { history } from '@umijs/max';
import { Button, Result } from 'antd';
import React from 'react';

const NotFoundPage: React.FC = () => (
  <Result
    status="404"
    title="页面不存在"
    subTitle="请检查访问地址，或返回解析下载继续使用。"
    extra={<Button type="primary" onClick={() => history.push('/parser')}>返回解析下载</Button>}
  />
);

export default NotFoundPage;
