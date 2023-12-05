<template>
  <v-layout column justify-center align-center>
    <v-flex xs12 sm8 md6>
      <v-card width="1200px" class="mx-auto mt-5">
        <v-card-title class="samrt-font">
          <h1 class="px-5 py-3">
Works List
</h1>
        </v-card-title>
        <v-simple-table>
          <thead>
            <tr>
              <th class="primary--text">No</th>
              <th class="primary--text">案件名</th>
              <th class="primary--text">時期</th>
              <th class="text-center primary--text">
詳細
</th>
            </tr>
          </thead>

          <tbody>
            <tr>
              <td>1</td>
              <td>EC系基幹システム新規開発</td>
              <td>2019/01~2020/09</td>
              <td>
                <v-row justify="center">
                  <WorkDetails :detail="detail1" />
                </v-row>
              </td>
            </tr>

            <tr>
              <td>2</td>
              <td>EC系基幹システム保守運用</td>
              <td>2019/05~2019/09</td>
              <td>
                <v-row justify="center">
                  <WorkDetails :detail="detail2" />
                </v-row>
              </td>
            </tr>
                        <tr>
              <td>3</td>
              <td>物流系パッケージシステム保守運用、追加開発</td>
              <td>2018/05~2018/12</td>
              <td>
                <v-row justify="center">
                  <WorkDetails :detail="detail3" />
                </v-row>
              </td>
            </tr>
          </tbody>
        </v-simple-table>
      </v-card>
    </v-flex>
  </v-layout>
</template>

<script>
import WorkDetails from "~/components/WorkDetails"

export default {
  layout: "signup",
  components: {
    WorkDetails,
  },
  data: () => ({
    detail3: {
      projectName: "物流システム保守運用・追加開発",
      language: "Java,C#",
      db: "Postgres",
      skill: "SQL Server、tera term、SVN",
      context: "エンジニアとしてITスキルの基礎を習得。主に、試験や保守業務を行い、外部システムと連携させるバッチの設計、開発を経験した。",
    },
    detail2: {
      projectName: "EC系基幹システム保守運用",
      language: "php,Javascript",
      db: "MySql",
      skill: "cakephp,Apache,AWS,Git,Github",
      context: "保守フェーズで参画し機能改修に携わったことで、保守の観点から保守性の高いコードを開発する技術に還元できました。",
    },
    detail1: {
      projectName: "EC系基幹システム新規開発",
      language: "Ruby,Javascript",
      db: "Postgres",
      skill: "Ruby on Rails,JQuery,AWS,Docker,Git,GitLab",
      context: "新規開発案件を主要な役割として、設計~試験フェーズを担当し、ruby、javascriptの実装スキルだけでなく、開発エンジニアとしての現場での対応力も非常に向上させる事ができました。",
    },
  }),
}
</script>
<style scoped>
.samrt-font {
  font-family: "smartfont";
}
</style>
