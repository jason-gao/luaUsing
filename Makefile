
env:
	openresty -V 
	lua -v 
	luajit -v
cp:
	cp /Users/crystal/codes/lua/luaUsing/openresty/resty.conf /usr/local/etc/openresty/vhost/resty.conf
reload:
	openresty -s reload
pub: cp reload
.PHONY: env pub
