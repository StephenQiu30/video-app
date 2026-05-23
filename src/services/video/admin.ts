// @ts-ignore
/* eslint-disable */
import { request } from "@umijs/max";

/** Get Metrics GET /api/admin/metrics */
export async function getMetricsApiAdminMetricsGet(options?: {
  [key: string]: any;
}) {
  return request<API.AdminMetricsResponse>("/api/admin/metrics", {
    method: "GET",
    ...(options || {}),
  });
}

/** List Users GET /api/admin/users */
export async function listUsersApiAdminUsersGet(
  // 叠加生成的Param类型 (非body参数swagger默认没有生成对象)
  params: API.listUsersApiAdminUsersGetParams,
  options?: { [key: string]: any }
) {
  return request<API.UserRead[]>("/api/admin/users", {
    method: "GET",
    params: {
      // limit has a default value: 100
      limit: "100",
      ...params,
    },
    ...(options || {}),
  });
}

/** Get User GET /api/admin/users/${param0} */
export async function getUserApiAdminUsersUserIdGet(
  // 叠加生成的Param类型 (非body参数swagger默认没有生成对象)
  params: API.getUserApiAdminUsersUserIdGetParams,
  options?: { [key: string]: any }
) {
  const { user_id: param0, ...queryParams } = params;
  return request<API.UserRead>(`/api/admin/users/${param0}`, {
    method: "GET",
    params: { ...queryParams },
    ...(options || {}),
  });
}

/** Update User PATCH /api/admin/users/${param0} */
export async function updateUserApiAdminUsersUserIdPatch(
  // 叠加生成的Param类型 (非body参数swagger默认没有生成对象)
  params: API.updateUserApiAdminUsersUserIdPatchParams,
  body: API.UserUpdate,
  options?: { [key: string]: any }
) {
  const { user_id: param0, ...queryParams } = params;
  return request<API.UserRead>(`/api/admin/users/${param0}`, {
    method: "PATCH",
    headers: {
      "Content-Type": "application/json",
    },
    params: { ...queryParams },
    data: body,
    ...(options || {}),
  });
}
