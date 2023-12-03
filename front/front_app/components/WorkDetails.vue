<template>
  <v-dialog v-model="dialog" persistent max-width="600px">
    <template v-slot:activator="{ on, attrs }">
      <v-btn color="primary" dark v-bind="attrs" v-on="on"> 詳細 </v-btn>
    </template>
    <v-card>
      <v-container>
        <v-row justify="center">
          <v-col cols="12" md="8">
            <base-material-card>
              <v-form>
                <v-container class="py-0">
                  <v-row>
                    <v-col cols="12" md="12">
                      <v-text-field
                        v-model="detail.projectName"
                        label="案件名"
                        readonly
                      />
                    </v-col>

                    <v-col cols="12" md="6">
                      <v-text-field
                        v-model="detail.language"
                        label="言語"
                        readonly
                      />
                    </v-col>

                    <v-col cols="12" md="6">
                      <v-text-field
                        v-model="detail.db"
                        label="データベース"
                        readonly
                      />
                    </v-col>

                    <v-col cols="12">
                      <v-text-field
                        v-model="detail.skill"
                        label="その他スキル"
                        readonly
                      />
                    </v-col>

                    <v-col cols="12">
                      <v-textarea
                        v-model="detail.context"
                        label="案件内容"
                        readonly
                      />
                    </v-col>

                    <v-col cols="12" class="text-right">
                      <v-card-actions>
                        <v-spacer />
                        <v-btn
                          color="blue darken-1"
                          text
                          @click="dialog = false"
                        >
                          Close
                        </v-btn>
                      </v-card-actions>
                    </v-col>
                  </v-row>
                </v-container>
              </v-form>
            </base-material-card>
          </v-col>
        </v-row>
      </v-container>
    </v-card>
  </v-dialog>
</template>
<script>
export default {
  props: ["detail"],
  data: () => ({
    dialog: false,
  }),
}
</script>
