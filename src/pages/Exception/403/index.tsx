import { history } from '@umijs/max';
import { Button, Result } from 'antd';
import React from 'react';

const ForbiddenPage: React.FC = () => (
  <Result
    status="403"
    title="无权限访问"
    subTitle="当前账号没有访问该页面的权限。"
    extra={<Button type="primary" onClick={() => history.push('/parser')}>返回解析下载</Button>}
  />
);

export default ForbiddenPage;
