// @ts-ignore
/* eslint-disable */
import { request } from "@umijs/max";

/** Parse Video POST /api/parse */
export async function parseVideoApiParsePost(
  body: API.ParseRequest,
  options?: { [key: string]: any }
) {
  return request<API.ParseResponse>("/api/parse", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    data: body,
    ...(options || {}),
  });
}
