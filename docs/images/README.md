# README image provenance

The native screenshots were captured from the installed FrameFetch Flutter app
on an iPhone 17 Pro Simulator running iOS 26.5 on 2026-08-31. The app was signed
in with a disposable local preview account that had no media or task history.

| File | Source | State |
| --- | --- | --- |
| `app-home.png` | `xcrun simctl io booted screenshot`, 1206×2622 | Empty public-link intake; no URL or media result |
| `app-provider-status.png` | `xcrun simctl io booted screenshot`, 1206×2622 | Server-provided platform catalog; no account, cookie, or probe address |
| `github-social-preview.jpg` | Built-in image generation compositing the two screenshots, 1774×887 | GitHub social banner; original UI content preserved |

For future captures, use a dedicated preview account and only repository-owned
or explicitly authorized media. Remove emails, media titles, complete URLs,
presigned URLs, tokens, cookies, and private AI results before committing.
