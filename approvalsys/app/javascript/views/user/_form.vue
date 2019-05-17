<template>
  <va-box :title="title" theme="box-primary" :isBorder="true" widgetType>
    <div slot="content">
        <va-input-group title="Email" vaId="email" type="text" placeholder="Enter Email" :value="user.email" @input=" value => updateValue(value, 'email')">
        </va-input-group>
        <va-input-group title="Encrypted password" vaId="encrypted_password" type="text" placeholder="Enter Encrypted password" :value="user.encrypted_password" @input=" value => updateValue(value, 'encrypted_password')">
        </va-input-group>
        <va-input-group title="Reset password token" vaId="reset_password_token" type="text" placeholder="Enter Reset password token" :value="user.reset_password_token" @input=" value => updateValue(value, 'reset_password_token')">
        </va-input-group>
        <va-input-group title="Reset password sent at" vaId="reset_password_sent_at" type="datetime" placeholder="Enter Reset password sent at" :value="user.reset_password_sent_at" @input=" value => updateValue(value, 'reset_password_sent_at')">
        </va-input-group>
        <va-input-group title="Remember created at" vaId="remember_created_at" type="datetime" placeholder="Enter Remember created at" :value="user.remember_created_at" @input=" value => updateValue(value, 'remember_created_at')">
        </va-input-group>
        <va-input-group title="Confirmation token" vaId="confirmation_token" type="text" placeholder="Enter Confirmation token" :value="user.confirmation_token" @input=" value => updateValue(value, 'confirmation_token')">
        </va-input-group>
        <va-input-group title="Confirmed at" vaId="confirmed_at" type="datetime" placeholder="Enter Confirmed at" :value="user.confirmed_at" @input=" value => updateValue(value, 'confirmed_at')">
        </va-input-group>
        <va-input-group title="Confirmation sent at" vaId="confirmation_sent_at" type="datetime" placeholder="Enter Confirmation sent at" :value="user.confirmation_sent_at" @input=" value => updateValue(value, 'confirmation_sent_at')">
        </va-input-group>
        <va-input-group title="Unconfirmed email" vaId="unconfirmed_email" type="text" placeholder="Enter Unconfirmed email" :value="user.unconfirmed_email" @input=" value => updateValue(value, 'unconfirmed_email')">
        </va-input-group>
        <va-input-group title="Name" vaId="name" type="text" placeholder="Enter Name" :value="user.name" @input=" value => updateValue(value, 'name')">
        </va-input-group>
        <va-input-group title="Role" vaId="role_id" type="number" placeholder="Enter Role" :value="user.role_id" @input=" value => updateValue(value, 'role_id')">
        </va-input-group>
    </div>
  </va-box>
</template>
<script>
    export default {
        name: "user-view-form",
        props: {
            user: {
                type: Object
            },
            title: {
                type: String,
                default: ""
            }
        },
        //common components are imported at lib/global.js
        components: { },
        methods: {
            updateValue(newValue, itemKey) {
                this.$emit('input', newValue, itemKey);
            }
        },
        computed: { },
        watch: { },
        //https://jp.vuejs.org/v2/api/#オプション-ライフサイクルフック
        created() { },
        mounted() { },
        data() {
            return {
            };
        }
    }
</script>

<style scoped>
</style>
