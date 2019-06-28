
env:
	openresty -V 
	lua -v 
	luajit -v
cp:
	cp /Users/crystal/codes/lua/luaUsing/openresty/resty.conf /usr/local/etc/openresty/vhost/resty.conf
reload:
	openresty -s reload

errlog: 
	tail -f /usr/local/var/log/nginx/error.log
acclog:
	tail -f /usr/local/var/log/nginx/access.log
		
pub: cp reload
.PHONY: env pub
