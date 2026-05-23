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
