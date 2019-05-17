const VueAxiosPlugin = {}
export default VueAxiosPlugin.install = function (Vue, { axios, csrfToken }) {
    if (!axios) {
        console.error('axiosが設定されていません。')
        return
    }

    if (typeof csrfToken === 'function' ) {
        axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()
    }

    const _axios_ = {
        send: (method, url, params) => {
            const requestParam = params.requestParam || {};
            const handleRes = params.handleRes || ((res) => console.log(res));
            const handleError = params.handleError || ((error) => console.log(error));

            axios({
                method: method,
                url: url,
                data: requestParam
              }).then(handleRes)
              .catch(handleError || function(err) {
                  console.log(err);
              });
        },
        get: (url, params = {}) => {
            _axios_.send('get', url, params);
        },
        post: (url, params = {}) => {
            _axios_.send('post', url, params);
        },
        patch: (url, params = {}) => {
            _axios_.send('patch', url, params);
        },
        put: (url, params = {}) => {
            _axios_.send('put', url, params);
        },
        delete: (url, params = {}) => {
            _axios_.send('delete', url, params);
        },
    }
    // Vue.axios = axios
    Vue.axios = _axios_

    Object.defineProperties(Vue.prototype, {
        axios: {
            get () {
                return _axios_
            }
        },
    })
}

