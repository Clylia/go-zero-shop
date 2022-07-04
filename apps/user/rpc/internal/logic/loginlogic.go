package logic

import (
	"context"
	"go-zero-shop/apps/user/rpc/model"
	"go-zero-shop/pkg/helpers"

	"github.com/pkg/errors"

	"go-zero-shop/apps/user/rpc/internal/svc"
	"go-zero-shop/apps/user/rpc/user"

	"github.com/zeromicro/go-zero/core/logx"
)

type LoginLogic struct {
	ctx    context.Context
	svcCtx *svc.ServiceContext
	logx.Logger
}

func NewLoginLogic(ctx context.Context, svcCtx *svc.ServiceContext) *LoginLogic {
	return &LoginLogic{
		ctx:    ctx,
		svcCtx: svcCtx,
		Logger: logx.WithContext(ctx),
	}
}

// 登录
func (l *LoginLogic) Login(in *user.LoginRequest) (*user.LoginResponse, error) {
	//verify user exists
	userDB, err := l.svcCtx.UserModel.FindOneByUsername(l.ctx, in.Username)
	if err != nil {
		if err == model.ErrNotFound {
			return nil, errors.New("username不存在")
		}
		return nil, err
	}
	//verify user password
	md5ByString := helpers.Md5(in.Password)
	if !(md5ByString == userDB.Password) {
		return nil, errors.New("账号或密码错误")
	}
	//返回用戶信息
	return &user.LoginResponse{
		Id:       userDB.Id,
		Username: userDB.Username,
		Phone:    userDB.Phone,
	}, nil
}
