# Auth API Contracts

هذه الوثيقة تثبت عقود Auth المتوقعة قبل ربط Cutra بخادم حقيقي. أي اختلاف في الـ backend يجب أن يسجل في `agents/DECISIONS.md` قبل تعديل الـ data layer.

## Base

- Base URL: `https://api.cutra.app/v1` (default in `DioApiClient`)
- Content type: `application/json`
- Auth header: `Authorization: Bearer <accessToken>`

## Login

`POST /auth/login`

Request:

```json
{
  "email": "user@example.com",
  "password": "password"
}
```

Response:

```json
{
  "accessToken": "access-token",
  "refreshToken": "refresh-token",
  "approvalStatus": "approved",
  "user": {
    "id": "user-id",
    "name": "User Name",
    "email": "user@example.com",
    "role": "user"
  }
}
```

## Register

`POST /auth/register`

Request:

```json
{
  "name": "User Name",
  "email": "user@example.com",
  "password": "password",
  "passwordConfirmation": "password"
}
```

Response uses the same session envelope as Login. New accounts are expected to return `approvalStatus: "pending"` unless the backend approves them immediately.

## Session

`GET /auth/session`

Headers:

```text
Authorization: Bearer <accessToken>
```

Response uses the same session envelope as Login. This endpoint is used to confirm whether a stored session is still `approved`, `pending`, or `rejected`.

## Pending and Rejected

There are no separate client-side endpoints for pending or rejected states. The app derives these screens from `approvalStatus`:

- `pending`: route to Pending screen.
- `rejected`: route to Rejected screen.
- `approved`: route to Home.

## Logout

`POST /auth/logout`

Headers:

```text
Authorization: Bearer <accessToken>
```

The app clears local session data even if the remote logout request fails after a stored token exists.
