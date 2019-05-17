<template>
  <row>
    <column class="col-md-2"></column>
    <column class="col-md-8">
        <user-form :user='user' title='New User' @input='updateValue'></user-form>
        <va-button name="Register" theme="primary" :isBlock="false" @click="register"></va-button>
        <va-button name="Cancel" theme="warning" :isBlock="false" align="right" @click="cancel"></va-button>
    </column>
    <column class="col-md-2"></column>
  </row>
</template>

<script>
    import UserForm from './_form'
    export default {
        name: "user-view-new",
        //common components are imported at lib/global.js
        //import form.vue
        components: {
            'user-form': UserForm
        },
        methods: {
            updateValue(newValue, itemkey) {
                this.$set(this.user, itemkey , newValue);
            },
            register() {
                this.axios.post("/users.json", {
                    requestParam: {
                        user: this.user
                    },
                    handleRes: (response) => {
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
        mounted () { },
        // beforeRouteLeave (to, from, next) {
        //     const isLeave = window.confirm('Do you really want to leave? you have unsaved changes!')
        //     next(isLeave);
        // },
        data() {
            return {
                user: { }
            };
        }
    }
</script>

<style scoped>
</style>
