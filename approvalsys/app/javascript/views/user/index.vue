<template>
  <row>
    <va-box theme="box-info" title="Users" :isBorder="true" widgetType>
      <va-pagination slot="pagination" :pageIndex="pagination.pageIndex" :totalCount="pagination.totalCount" @click="paging"></va-pagination>
      <div slot="content" class="table-responsive">
        <table class="table table-bordered table-hover dataTable">
          <thead>
            <tr>
              <th>Id</th>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
              <th>Encrypted password</th>
              <th>Reset password token</th>
              <th>Reset password sent at</th>
              <th>Remember created at</th>
              <th>Confirmation token</th>
              <th>Confirmed at</th>
              <th>Confirmation sent at</th>
              <th>Unconfirmed email</th>


            </tr>
          </thead>
          <tbody>
            <router-link tag="tr" :to="{name: 'UserEdit', params: {id: user.id}}" v-for="(user, index) in users" :key="index">
              <td>{{user.id}}</td>
              <td>{{user.name}}</td>
              <td>{{user.email}}</td>
              <td>{{user.role_id}}</td>
              <td>{{user.encrypted_password}}</td>
              <td>{{user.reset_password_token}}</td>
              <td>{{user.reset_password_sent_at}}</td>
              <td>{{user.remember_created_at}}</td>
              <td>{{user.confirmation_token}}</td>
              <td>{{user.confirmed_at}}</td>
              <td>{{user.confirmation_sent_at}}</td>
              <td>{{user.unconfirmed_email}}</td>
            </router-link>
          </tbody>
        </table>
      </div>
      <div class="box-footer clearfix" slot="footer">
        <router-link :to="{name: 'UserNew'}" class="btn btn-sm btn-info btn-flat pull-left"><i class="fa fa-plus"></i> Add User</router-link>
        <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All Users</a>
      </div>
    </va-box>
  </row>
</template>

<script>
    export default {
        name: "user-view-index",
        //common components are imported at lib/global.js
        components: {
        },
        methods: {
            paging(val) {
              this.pagination.pageIndex = val;
            },
            getData(page_no = 0){
              this.axios.get("/users.json", {
                  requestParam: {
                  },
                  handleRes: response => {
                    //list result
                    this.users = response.data;
                    this.pagination.totalCount = this.users.length;
                  },
                  handleError: error => {
                    console.log(error);
                    this.alert.error(this, error);
                  }
              });
            }
        },
        computed: { },
        watch: { },
        //https://jp.vuejs.org/v2/api/#オプション-ライフサイクルフック
        created () { },
        mounted () { 
          this.getData();
        },
        data() {
            return {
                users: [
                    {
                        id: "",
                        email: "",
                        encrypted_password: "",
                        reset_password_token: "",
                        reset_password_sent_at: "",
                        remember_created_at: "",
                        confirmation_token: "",
                        confirmed_at: "",
                        confirmation_sent_at: "",
                        unconfirmed_email: "",
                        name: "",
                        role_id: "",
                    }
                ],
                pagination :{
                  pageIndex: 0,
                  totalCount: 0
                }
            };
        }
    };
</script>

<style scoped>
</style>
