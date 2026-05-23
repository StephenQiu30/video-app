// @ts-ignore
/* eslint-disable */
import { request } from "@umijs/max";

/** List Tasks GET /api/tasks */
export async function listTasksApiTasksGet(
  // 叠加生成的Param类型 (非body参数swagger默认没有生成对象)
  params: API.listTasksApiTasksGetParams,
  options?: { [key: string]: any }
) {
  return request<API.TaskRead[]>("/api/tasks", {
    method: "GET",
    params: {
      ...params,
    },
    ...(options || {}),
  });
}

/** Create Task POST /api/tasks */
export async function createTaskApiTasksPost(
  body: API.TaskCreate,
  options?: { [key: string]: any }
) {
  return request<API.TaskRead>("/api/tasks", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    data: body,
    ...(options || {}),
  });
}

/** Get Task GET /api/tasks/${param0} */
export async function getTaskApiTasksTaskIdGet(
  // 叠加生成的Param类型 (非body参数swagger默认没有生成对象)
  params: API.getTaskApiTasksTaskIdGetParams,
  options?: { [key: string]: any }
) {
  const { task_id: param0, ...queryParams } = params;
  return request<API.TaskRead>(`/api/tasks/${param0}`, {
    method: "GET",
    params: { ...queryParams },
    ...(options || {}),
  });
}

/** Cancel Download Task POST /api/tasks/${param0}/cancel */
export async function cancelDownloadTaskApiTasksTaskIdCancelPost(
  // 叠加生成的Param类型 (非body参数swagger默认没有生成对象)
  params: API.cancelDownloadTaskApiTasksTaskIdCancelPostParams,
  options?: { [key: string]: any }
) {
  const { task_id: param0, ...queryParams } = params;
  return request<API.TaskRead>(`/api/tasks/${param0}/cancel`, {
    method: "POST",
    params: { ...queryParams },
    ...(options || {}),
  });
}

/** Get Download Link GET /api/tasks/${param0}/download-link */
export async function getDownloadLinkApiTasksTaskIdDownloadLinkGet(
  // 叠加生成的Param类型 (非body参数swagger默认没有生成对象)
  params: API.getDownloadLinkApiTasksTaskIdDownloadLinkGetParams,
  options?: { [key: string]: any }
) {
  const { task_id: param0, ...queryParams } = params;
  return request<API.DownloadLinkResponse>(
    `/api/tasks/${param0}/download-link`,
    {
      method: "GET",
      params: { ...queryParams },
      ...(options || {}),
    }
  );
}

/** Get Task Events GET /api/tasks/${param0}/events */
export async function getTaskEventsApiTasksTaskIdEventsGet(
  // 叠加生成的Param类型 (非body参数swagger默认没有生成对象)
  params: API.getTaskEventsApiTasksTaskIdEventsGetParams,
  options?: { [key: string]: any }
) {
  const { task_id: param0, ...queryParams } = params;
  return request<API.TaskEventRead[]>(`/api/tasks/${param0}/events`, {
    method: "GET",
    params: { ...queryParams },
    ...(options || {}),
  });
}

/** Export Task Pdf GET /api/tasks/${param0}/pdf */
export async function exportTaskPdfApiTasksTaskIdPdfGet(
  // 叠加生成的Param类型 (非body参数swagger默认没有生成对象)
  params: API.exportTaskPdfApiTasksTaskIdPdfGetParams,
  options?: { [key: string]: any }
) {
  const { task_id: param0, ...queryParams } = params;
  return request<any>(`/api/tasks/${param0}/pdf`, {
    method: "GET",
    params: { ...queryParams },
    ...(options || {}),
  });
}

/** Retry Download Task POST /api/tasks/${param0}/retry */
export async function retryDownloadTaskApiTasksTaskIdRetryPost(
  // 叠加生成的Param类型 (非body参数swagger默认没有生成对象)
  params: API.retryDownloadTaskApiTasksTaskIdRetryPostParams,
  options?: { [key: string]: any }
) {
  const { task_id: param0, ...queryParams } = params;
  return request<API.TaskRead>(`/api/tasks/${param0}/retry`, {
    method: "POST",
    params: { ...queryParams },
    ...(options || {}),
  });
}

/** Stream Tasks GET /api/tasks/stream */
export async function streamTasksApiTasksStreamGet(
  // 叠加生成的Param类型 (非body参数swagger默认没有生成对象)
  params: API.streamTasksApiTasksStreamGetParams,
  options?: { [key: string]: any }
) {
  return request<any>("/api/tasks/stream", {
    method: "GET",
    params: {
      // limit has a default value: 50
      limit: "50",
      ...params,
    },
    ...(options || {}),
  });
}
