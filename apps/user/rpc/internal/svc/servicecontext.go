package svc

import (
	"github.com/zeromicro/go-zero/core/stores/sqlx"
	"go-zero-shop/apps/user/rpc/internal/config"
	"go-zero-shop/apps/user/rpc/model"
)

type ServiceContext struct {
	Config config.Config
	//add dependency on user model
	UserModel model.UserModel
}

func NewServiceContext(c config.Config) *ServiceContext {
	sqlConn := sqlx.NewMysql(c.Mysql.DataSource)
	return &ServiceContext{
		Config:    c,
		UserModel: model.NewUserModel(sqlConn, c.CacheRedis),
	}
}
