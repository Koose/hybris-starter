<script type="text/x-template" id="dialog-template">
    <div :id="[id]" class="modal" :class="['modal--' + type]" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{{ strings.title }}</h5>
                    <button type="button" class="close" data-dialog="close" aria-label="Close">
                        <span aria-hidden="true" class="icon-close"></span>
                    </button>
                </div>

                <div class="modal-body">
                    <p>{{ strings.description }}</p>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dialog="confirm">{{ strings.confirmBtnLabel.confirm }}</button>
                    <template v-if="type !== 'alert'">
                        <button type="button" class="btn btn-secondary" data-dialog="cancel">{{ strings.cancelBtnLabel }}</button>
                    </template>
                </div>
            </div>
        </div>
    </div>
</script>
