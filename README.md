# env
- macos mojave 10.14.4 (18E226)
- vs code 版本 1.35.1 (1.35.1) 
- vs code 默认不是自动保存，file-auto save 打开，否则 lua xx.lua 啥也不输出，别被坑哭～～
- lua version 5.3.5
- luajit 2.0.5 兼容lua5.1




# install
brew install lua

# doc
- https://moonbingbing.gitbooks.io/openresty-best-practices/lua/for.html
- https://www.kancloud.cn/thinkphp/lua-guide/43810
- https://wiki.jikexueyuan.com/project/lua/overview.html
- https://aillieo.cn/post/2018-06-24-lua-notes-02/
- https://luarocks.org/
- http://luajit.org/ext_ffi_api.html
- lua-resty开头的库是跑在nginx里的,lua-*开头的是通用的，像lua-cjson这种只要是lua就能跑
- 单独用的话要用ffi.load手动加载openssl库
- luajit自带ffi


# luaUsing
- lua demo.lua

# kong 插件开发
- https://ms2008.github.io/2018/06/19/kong-plugin-development/


# 兼容性

```lua

-- Provide unpack for Lua 5.3+ built without LUA_COMPAT_UNPACK
local unpack = unpack
if table.unpack then unpack = table.unpack end


```

- luarocks
- brew install luarocks
- luarocks install luacrypto OPENSSL_DIR=/usr/local/Cellar/openssl/1.0.2r

```text
brew upgrade openssl
If you need to have curl-openssl first in your PATH run:
  echo 'export PATH="/usr/local/opt/curl-openssl/bin:$PATH"' >> ~/.bash_profile

For compilers to find curl-openssl you may need to set:
  export LDFLAGS="-L/usr/local/opt/curl-openssl/lib"
  export CPPFLAGS="-I/usr/local/opt/curl-openssl/include"

For pkg-config to find curl-openssl you may need to set:
  export PKG_CONFIG_PATH="/usr/local/opt/curl-openssl/lib/pkgconfig"

```
