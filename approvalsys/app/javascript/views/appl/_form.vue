<template>
  <va-box :title="title" theme="box-primary" :isBorder="true" widgetType>
    <div slot="content">
        <va-input-group title="User" vaId="user_id" type="text" placeholder="Enter User" :value="appl.user_id" @input=" value => updateValue(value, 'user_id')">
        </va-input-group>
        <va-input-group title="Title" vaId="title" type="text" placeholder="Enter Title" :value="appl.title" @input=" value => updateValue(value, 'title')">
        </va-input-group>
        <va-input-group title="State" vaId="state" type="number" placeholder="Enter State" :value="appl.state" @input=" value => updateValue(value, 'state')">
        </va-input-group>
        <va-textarea-group title="Description" vaId="description" :isDisabled="false" placeholder="Enter Description" :value="appl.description" @input=" value => updateValue(value, 'description')"></va-textarea-group>
        <va-checkbox text="Checked" :checkedValue="true" :value="appl.checked"  @change=" value => updateValue(value, 'checked')"></va-checkbox>
    </div>
  </va-box>
</template>
<script>
    export default {
        name: "appl-view-form",
        props: {
            appl: {
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
