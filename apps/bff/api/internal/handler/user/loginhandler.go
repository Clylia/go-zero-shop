package user

import (
	"go-zero-shop/pkg/response"
	"net/http"

	"go-zero-shop/apps/bff/api/internal/logic/user"
	"go-zero-shop/apps/bff/api/internal/svc"
	"go-zero-shop/apps/bff/api/internal/types"

	"github.com/zeromicro/go-zero/rest/httpx"
)

func LoginHandler(svcCtx *svc.ServiceContext) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		var req types.LoginReq
		if err := httpx.Parse(r, &req); err != nil {
			response.ParamErrorResult(r, w, err)
			return
		}
		l := user.NewLoginLogic(r.Context(), svcCtx)
		resp, err := l.Login(&req)
		response.HttpResult(r, w, resp, err)
	}
}
