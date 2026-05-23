// @ts-ignore
/* eslint-disable */
import { request } from "@umijs/max";

/** Health GET /health */
export async function healthHealthGet(options?: { [key: string]: any }) {
  return request<API.HealthResponse>("/health", {
    method: "GET",
    ...(options || {}),
  });
}

/** Ready GET /ready */
export async function readyReadyGet(options?: { [key: string]: any }) {
  return request<API.ReadinessResponse>("/ready", {
    method: "GET",
    ...(options || {}),
  });
}
