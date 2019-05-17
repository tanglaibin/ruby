<template>

  <div v-if="isHorizontal" class="form-group">
    <label :for="vaId" class="col-sm-2 control-label">{{ title }}</label>
    <div class="col-sm-10">
      <input
        :type="type"
        :class="[formControl, getSize]"
        :id="vaId"
        :placeholder="placeholder"
        v-model="_value_"
        />
    </div>
  </div>
  <input v-else
         :type="type"
         :class="[formControl, getSize]"
         :id="vaId"
         :placeholder="placeholder"
         :disabled="isDisabled"
         v-model="_value_"
        />
</template>

<script>
export default {
  name: 'va-input',
  props: {
    type: {
      type: String,
      default: 'text'
    },
    vaId: {
      type: String
    },
    placeholder: {
      type: String,
      default: 'Enter Text...'
    },
    size: {
      type: String
    },
    value: {
      // type: String
    },
    isFormControl: {
      type: Boolean,
      default: true
    },
    isHorizontal: {
      type: Boolean,
      default: false
    },
    title: {
      type: String
    },
    isDisabled: {
      type: Boolean,
      default: false
    }
  },
  methods: {
    updateValue: function(newValue) {
      this.$emit('input', newValue);
    }
  },
  computed: {
    _value_: {
      get() {
        return this.value
      },
      set(value) {
        this.updateValue(value)
      }
    },
    getSize () {
      if (!this.size) {
        return ''
      }

      return 'input-' + this.size
    },
    formControl () {
      return this.isFormControl ? 'form-control' : ''
    }
  },
  created () {

  }
}
</script>
