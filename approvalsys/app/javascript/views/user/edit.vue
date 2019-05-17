<template>
  <row>
    <column class="col-md-2"></column>
    <column class="col-md-8">
        <user-form :user='user' title='Edit User' @input='updateValue'></user-form>
        <va-button name="Update" theme="primary" :isBlock="false" @click="update"></va-button>
        <va-button name="Cancel" theme="warning" :isBlock="false" align="right" @click="cancel"></va-button>
    </column>
    <column class="col-md-2"></column>
  </row>
</template>

<script>
    import UserForm from './_form'
    export default {
        name: "user-view-edit",
        //common components are imported at lib/global.js
        //import form.vue
        components: {
            'user-form': UserForm
        },
        methods: {
            updateValue(newValue, itemkey) {
                this.$set(this.user, itemkey , newValue);
            },
            update() {
                this.axios.patch("/users/" + this.$route.params.id + ".json", {
                    requestParam: {
                        user: this.user
                    },
                    handleRes: response => {
                        //log response
                        console.log(response);
                        //back to index
                        this.alert.success(this, "Success.", ()=> {
                            this.$router.push({name: 'UserIndex'});
                        });
                    },
                    handleError: error => {
                      console.log(error);
                      this.alert.error(this, error);
                    }
                });
            },
            cancel() {
                this.$router.push({name: 'UserIndex'});
            }
        },
        computed: { },
        watch: { },
        //https://jp.vuejs.org/v2/api/#オプション-ライフサイクルフック
        created () { },
        mounted () { 
            this.axios.get("/users/" + this.$route.params.id + ".json", {
                handleRes: response => {
                    this.user = response.data;
                }
            });
        },
        // beforeRouteLeave (to, from, next) {
        //     const isLeave = window.confirm('Do you really want to leave? you have unsaved changes!')
        //     next(isLeave);
        // },
        data() {
            return {
                user: 
                {
                    id: '1',
                    email: 'MyString',
                    encrypted_password: 'MyString',
                    reset_password_token: 'MyString',
                    reset_password_sent_at: '2019-05-15 04:03:22',
                    remember_created_at: '2019-05-15 04:03:22',
                    confirmation_token: 'MyString',
                    confirmed_at: '2019-05-15 04:03:22',
                    confirmation_sent_at: '2019-05-15 04:03:22',
                    unconfirmed_email: 'MyString',
                    name: 'MyString',
                    role_id: '1',
                }
            };
        }
    }
</script>

<style scoped>
</style>
