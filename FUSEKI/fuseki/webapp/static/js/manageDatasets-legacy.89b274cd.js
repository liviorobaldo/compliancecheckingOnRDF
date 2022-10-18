"use strict";(self["webpackChunkapache_jena_fuseki"]=self["webpackChunkapache_jena_fuseki"]||[]).push([[349],{8358:function(e,t,n){n.d(t,{Z:function(){return b}});var a=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("b-nav",{attrs:{"card-header":"",tabs:""}},[n("b-nav-item",{attrs:{to:"/manage","exact-active-class":"active"}},[n("FontAwesomeIcon",{attrs:{icon:"database"}}),n("span",{staticClass:"ml-1"},[e._v("existing datasets")])],1),n("b-nav-item",{attrs:{to:"/manage/new","exact-active-class":"active"}},[n("FontAwesomeIcon",{attrs:{icon:"plus-circle"}}),n("span",{staticClass:"ml-1"},[e._v("new dataset")])],1),n("b-nav-item",{attrs:{to:"/manage/tasks","exact-active-class":"active"}},[n("FontAwesomeIcon",{attrs:{icon:"tasks"}}),n("span",{staticClass:"ml-1"},[e._v("tasks")])],1)],1)},o=[],s=n(8947),i=n(1436),r=n(7810);function c(){var e="/home/afs/ASF/Release/jena/target/checkout/jena-fuseki2/jena-fuseki-ui/src/components/manage/Menu.vue",t="13e98de7fe7de04b4bd99b4f22c94d4994bc2b94",n=new Function("return this")(),a="__coverage__",o={path:"/home/afs/ASF/Release/jena/target/checkout/jena-fuseki2/jena-fuseki-ui/src/components/manage/Menu.vue",statementMap:{0:{start:{line:49,column:0},end:{line:49,column:46}}},fnMap:{},branchMap:{},s:{0:0},f:{},b:{},inputSourceMap:{version:3,sources:["Menu.vue"],names:[],mappings:";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;AA4CA;AACA;AACA;;AAEA;;AAEA;AACA;;AAEA;AACA;AACA;AACA",file:"Menu.vue",sourceRoot:"src/components/manage",sourcesContent:['\x3c!--\n   Licensed to the Apache Software Foundation (ASF) under one or more\n   contributor license agreements.  See the NOTICE file distributed with\n   this work for additional information regarding copyright ownership.\n   The ASF licenses this file to You under the Apache License, Version 2.0\n   (the "License"); you may not use this file except in compliance with\n   the License.  You may obtain a copy of the License at\n\n       http://www.apache.org/licenses/LICENSE-2.0\n\n   Unless required by applicable law or agreed to in writing, software\n   distributed under the License is distributed on an "AS IS" BASIS,\n   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\n   See the License for the specific language governing permissions and\n   limitations under the License.\n--\x3e\n\n<template>\n  <b-nav card-header tabs>\n    <b-nav-item\n      :to="`/manage`"\n      exact-active-class="active"\n    >\n      <FontAwesomeIcon icon="database" />\n      <span class="ml-1">existing datasets</span>\n    </b-nav-item>\n    <b-nav-item\n      :to="`/manage/new`"\n      exact-active-class="active"\n    >\n      <FontAwesomeIcon icon="plus-circle" />\n      <span class="ml-1">new dataset</span>\n    </b-nav-item>\n    <b-nav-item\n      :to="`/manage/tasks`"\n      exact-active-class="active"\n    >\n      <FontAwesomeIcon icon="tasks" />\n      <span class="ml-1">tasks</span>\n    </b-nav-item>\n  </b-nav>\n</template>\n\n<script>\nimport { library } from \'@fortawesome/fontawesome-svg-core\'\nimport { faDatabase, faPlusCircle, faTasks } from \'@fortawesome/free-solid-svg-icons\'\nimport { FontAwesomeIcon } from \'@fortawesome/vue-fontawesome\'\n\nlibrary.add(faDatabase, faPlusCircle, faTasks)\n\nexport default {\n  name: \'ManageMenu\',\n\n  components: {\n    FontAwesomeIcon\n  }\n}\n<\/script>\n']},_coverageSchema:"1a1c01bbd47fc00a2c39e90264f33305004495a9",hash:"13e98de7fe7de04b4bd99b4f22c94d4994bc2b94"},s=n[a]||(n[a]={});s[e]&&s[e].hash===t||(s[e]=o);var i=s[e];return c=function(){return i},i}c(),c().s[0]++,s.vI.add(i.t5N,i.KtF,i.A8);var l={name:"ManageMenu",components:{FontAwesomeIcon:r.GN}},m=l,d=n(1001),u=(0,d.Z)(m,a,o,!1,null,null,null),b=u.exports},1587:function(e,t,n){n.r(t),n.d(t,{default:function(){return k}});var a=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("b-container",{attrs:{fluid:""}},[n("b-row",{staticClass:"mt-4"},[n("b-col",{attrs:{cols:"12"}},[n("h2",[e._v("Manage datasets")]),n("b-card",{attrs:{"no-body":""}},[n("b-card-header",{attrs:{"header-tag":"nav"}},[n("Menu")],1),n("b-card-body",[n("div",[n("b-row",[n("b-col",[n("table-listing",{attrs:{fields:e.fields,items:e.items,"is-busy":e.isBusy},scopedSlots:e._u([{key:"empty",fn:function(){return[n("h4",[e._v("No datasets created - "),n("router-link",{attrs:{to:"/manage/new"}},[e._v("add one")])],1)]},proxy:!0},{key:"cell(actions)",fn:function(t){return[n("b-button",{staticClass:"mr-0 mr-md-2 mb-2 mb-md-0 d-block d-md-inline-block",attrs:{to:"/dataset"+t.item.name+"/query",variant:"primary"}},[n("FontAwesomeIcon",{attrs:{icon:"question-circle"}}),n("span",{staticClass:"ml-1"},[e._v("query")])],1),n("b-popover",{attrs:{target:"delete-dataset-"+t.item.name+"-button",triggers:"manual",placement:"auto"},scopedSlots:e._u([{key:"title",fn:function(){return[n("b-button",{staticClass:"close",attrs:{"aria-label":"Close"},on:{click:function(n){return e.hidePopover("delete-dataset-"+t.item.name+"-button")}}},[n("span",{staticClass:"d-inline-block",attrs:{"aria-hidden":"true"}},[e._v("×")])]),e._v(" Confirm ")]},proxy:!0}],null,!0)},[n("div",{staticClass:"text-center"},[n("b-alert",{attrs:{show:"",variant:"danger"}},[e._v("Are you sure you want to delete dataset "+e._s(t.item.name)+"?"),n("br"),n("br"),e._v("This action cannot be reversed.")]),n("b-button",{staticClass:"mr-2",attrs:{variant:"primary"},on:{click:function(n){e.hidePopover("delete-dataset-"+t.item.name+"-button"),e.deleteDataset(t.item.name)}}},[e._v("submit")]),n("b-button",{on:{click:function(n){return e.hidePopover("delete-dataset-"+t.item.name+"-button")}}},[e._v("cancel")])],1)]),n("b-button",{ref:"delete-dataset-"+t.item.name+"-button",staticClass:"mr-0 mr-md-2 mb-2 mb-md-0 d-block d-md-inline-block",attrs:{id:"delete-dataset-"+t.item.name+"-button",variant:"primary",href:"#"},on:{click:function(n){return e.showPopover("delete-dataset-"+t.item.name+"-button")}}},[n("FontAwesomeIcon",{attrs:{icon:"times-circle"}}),n("span",{staticClass:"ml-1"},[e._v("remove")])],1),n("b-popover",{attrs:{target:"backup-dataset-"+t.item.name+"-button",triggers:"manual",placement:"auto"},scopedSlots:e._u([{key:"title",fn:function(){return[n("b-button",{staticClass:"close",attrs:{"aria-label":"Close"},on:{click:function(n){return e.showPopover("backup-dataset-"+t.item.name+"-button")}}},[n("span",{staticClass:"d-inline-block",attrs:{"aria-hidden":"true"}},[e._v("×")])]),e._v(" Confirm ")]},proxy:!0}],null,!0)},[n("div",{staticClass:"text-center"},[n("b-alert",{attrs:{show:"",variant:"warning"}},[e._v("Are you sure you want to create a backup of dataset "+e._s(t.item.name)+"?"),n("br"),n("br"),e._v("This action may take some time to complete.")]),n("b-button",{staticClass:"mr-2",attrs:{variant:"primary"},on:{click:function(n){e.hidePopover("backup-dataset-"+t.item.name+"-button"),e.backupDataset(t.item.name)}}},[e._v("submit")]),n("b-button",{on:{click:function(n){return e.hidePopover("backup-dataset-"+t.item.name+"-button")}}},[e._v("cancel")])],1)]),n("b-button",{ref:"backup-dataset-"+t.item.name+"-button",staticClass:"mr-0 mr-md-2 mr-0 mb-2 mb-md-0 d-block d-md-inline-block",attrs:{id:"backup-dataset-"+t.item.name+"-button",variant:"primary",href:"#"},on:{click:function(n){return e.showPopover("backup-dataset-"+t.item.name+"-button")}}},[n("FontAwesomeIcon",{attrs:{icon:"download"}}),n("span",{staticClass:"ml-1"},[e._v("backup")])],1),n("b-button",{staticClass:"mr-0 mr-md-2 mr-0 mb-2 mb-md-0 d-block d-md-inline-block",attrs:{to:"/dataset"+t.item.name+"/upload",variant:"primary"}},[n("FontAwesomeIcon",{attrs:{icon:"upload"}}),n("span",{staticClass:"ml-1"},[e._v("add data")])],1),n("b-button",{staticClass:"mr-0 mb-md-0 d-block d-md-inline-block",attrs:{to:"/dataset"+t.item.name+"/info",variant:"primary"}},[n("FontAwesomeIcon",{attrs:{icon:"tachometer-alt"}}),n("span",{staticClass:"ml-1"},[e._v("info")])],1)]}}])})],1)],1)],1)])],1)],1)],1)],1)},o=[],s=n(6198),i=n(7212),r=n.n(i),c=n(8358),l=n(1439),m=n(4840),d=n(8947),u=n(1436),b=n(7810);function p(){var e="/home/afs/ASF/Release/jena/target/checkout/jena-fuseki2/jena-fuseki-ui/src/views/manage/ExistingDatasets.vue",t="5c8b217018d3ab58af726bb042a99849d4f103ae",n=new Function("return this")(),a="__coverage__",o={path:"/home/afs/ASF/Release/jena/target/checkout/jena-fuseki2/jena-fuseki-ui/src/views/manage/ExistingDatasets.vue",statementMap:{0:{start:{line:153,column:0},end:{line:153,column:55}},1:{start:{line:163,column:4},end:{line:165,column:5}},2:{start:{line:176,column:6},end:{line:176,column:58}},3:{start:{line:177,column:6},end:{line:181,column:8}},4:{start:{line:182,column:6},end:{line:182,column:27}},5:{start:{line:185,column:23},end:{line:185,column:75}},6:{start:{line:186,column:21},end:{line:186,column:41}},7:{start:{line:187,column:6},end:{line:191,column:8}},8:{start:{line:192,column:6},end:{line:192,column:27}},9:{start:{line:195,column:6},end:{line:195,column:47}},10:{start:{line:198,column:6},end:{line:200,column:7}},11:{start:{line:199,column:8},end:{line:199,column:66}},12:{start:{line:201,column:6},end:{line:201,column:47}},13:{start:{line:202,column:6},end:{line:202,column:30}}},fnMap:{0:{name:"(anonymous_0)",decl:{start:{line:162,column:2},end:{line:162,column:3}},loc:{start:{line:162,column:10},end:{line:166,column:3}},line:162},1:{name:"(anonymous_1)",decl:{start:{line:175,column:4},end:{line:175,column:5}},loc:{start:{line:175,column:38},end:{line:183,column:5}},line:175},2:{name:"(anonymous_2)",decl:{start:{line:184,column:4},end:{line:184,column:5}},loc:{start:{line:184,column:38},end:{line:193,column:5}},line:184},3:{name:"(anonymous_3)",decl:{start:{line:194,column:4},end:{line:194,column:5}},loc:{start:{line:194,column:21},end:{line:196,column:5}},line:194},4:{name:"(anonymous_4)",decl:{start:{line:197,column:4},end:{line:197,column:5}},loc:{start:{line:197,column:21},end:{line:203,column:5}},line:197}},branchMap:{0:{loc:{start:{line:198,column:6},end:{line:200,column:7}},type:"if",locations:[{start:{line:198,column:6},end:{line:200,column:7}},{start:{line:void 0,column:void 0},end:{line:void 0,column:void 0}}],line:198}},s:{0:0,1:0,2:0,3:0,4:0,5:0,6:0,7:0,8:0,9:0,10:0,11:0,12:0,13:0},f:{0:0,1:0,2:0,3:0,4:0},b:{0:[0,0]},inputSourceMap:{version:3,sources:["ExistingDatasets.vue"],names:[],mappings:";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;AAiJA;AACA;AACA;AACA;AACA;AACA;;AAEA;;AAEA;AACA;;AAEA;AACA;AACA;;AAEA;AACA;AACA;AACA;AACA;;AAEA;AACA;AACA;AACA;AACA;;AAEA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA;AACA",file:"ExistingDatasets.vue",sourceRoot:"src/views/manage",sourcesContent:['\x3c!--\n   Licensed to the Apache Software Foundation (ASF) under one or more\n   contributor license agreements.  See the NOTICE file distributed with\n   this work for additional information regarding copyright ownership.\n   The ASF licenses this file to You under the Apache License, Version 2.0\n   (the "License"); you may not use this file except in compliance with\n   the License.  You may obtain a copy of the License at\n\n       http://www.apache.org/licenses/LICENSE-2.0\n\n   Unless required by applicable law or agreed to in writing, software\n   distributed under the License is distributed on an "AS IS" BASIS,\n   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\n   See the License for the specific language governing permissions and\n   limitations under the License.\n--\x3e\n\n<template>\n  <b-container fluid>\n    <b-row class="mt-4">\n      <b-col cols="12">\n        <h2>Manage datasets</h2>\n        <b-card no-body>\n          <b-card-header header-tag="nav">\n            <Menu />\n          </b-card-header>\n          <b-card-body>\n            <div>\n              <b-row>\n                <b-col>\n                  <table-listing\n                    :fields="fields"\n                    :items="items"\n                    :is-busy="isBusy"\n                  >\n                    <template v-slot:empty>\n                      <h4>No datasets created - <router-link to="/manage/new">add one</router-link></h4>\n                    </template>\n                    <template v-slot:cell(actions)="data">\n                      <b-button\n                        :to="`/dataset${data.item.name}/query`"\n                        variant="primary"\n                        class="mr-0 mr-md-2 mb-2 mb-md-0 d-block d-md-inline-block">\n                        <FontAwesomeIcon icon="question-circle" />\n                        <span class="ml-1">query</span>\n                      </b-button>\n                      <b-popover\n                        :target="`delete-dataset-${data.item.name}-button`"\n                        triggers="manual"\n                        placement="auto"\n                      >\n                        <template v-slot:title>\n                          <b-button\n                            @click="hidePopover(`delete-dataset-${data.item.name}-button`)"\n                            class="close"\n                            aria-label="Close">\n                            <span class="d-inline-block" aria-hidden="true">&times;</span>\n                          </b-button>\n                          Confirm\n                        </template>\n                        <div class="text-center">\n                          <b-alert show variant="danger">Are you sure you want to delete dataset {{ data.item.name }}?<br/><br/>This action cannot be reversed.</b-alert>\n                          <b-button\n                            @click="hidePopover(`delete-dataset-${data.item.name}-button`);deleteDataset(data.item.name)"\n                            variant="primary"\n                            class="mr-2"\n                          >submit</b-button>\n                          <b-button\n                            @click="hidePopover(`delete-dataset-${data.item.name}-button`)"\n                          >cancel</b-button>\n                        </div>\n                      </b-popover>\n                      <b-button\n                        :id="`delete-dataset-${data.item.name}-button`"\n                        :ref="`delete-dataset-${data.item.name}-button`"\n                        @click="showPopover(`delete-dataset-${data.item.name}-button`)"\n                        variant="primary"\n                        href="#"\n                        class="mr-0 mr-md-2 mb-2 mb-md-0 d-block d-md-inline-block">\n                        <FontAwesomeIcon icon="times-circle" />\n                        <span class="ml-1">remove</span>\n                      </b-button>\n                      <b-popover\n                        :target="`backup-dataset-${data.item.name}-button`"\n                        triggers="manual"\n                        placement="auto"\n                      >\n                        <template v-slot:title>\n                          <b-button\n                            @click="showPopover(`backup-dataset-${data.item.name}-button`)"\n                            class="close"\n                            aria-label="Close">\n                            <span class="d-inline-block" aria-hidden="true">&times;</span>\n                          </b-button>\n                          Confirm\n                        </template>\n                        <div class="text-center">\n                          <b-alert show variant="warning">Are you sure you want to create a backup of dataset {{ data.item.name }}?<br/><br/>This action may take some time to complete.</b-alert>\n                          <b-button\n                            @click="hidePopover(`backup-dataset-${data.item.name}-button`);backupDataset(data.item.name)"\n                            variant="primary"\n                            class="mr-2"\n                          >submit</b-button>\n                          <b-button\n                            @click="hidePopover(`backup-dataset-${data.item.name}-button`)"\n                          >cancel</b-button>\n                        </div>\n                      </b-popover>\n                      <b-button\n                        :id="`backup-dataset-${data.item.name}-button`"\n                        :ref="`backup-dataset-${data.item.name}-button`"\n                        @click="showPopover(`backup-dataset-${data.item.name}-button`)"\n                        variant="primary"\n                        href="#"\n                        class="mr-0 mr-md-2 mr-0 mb-2 mb-md-0 d-block d-md-inline-block">\n                        <FontAwesomeIcon icon="download" />\n                        <span class="ml-1">backup</span>\n                      </b-button>\n                      <b-button\n                        :to="`/dataset${data.item.name}/upload`"\n                        variant="primary"\n                        class="mr-0 mr-md-2 mr-0 mb-2 mb-md-0 d-block d-md-inline-block">\n                        <FontAwesomeIcon icon="upload" />\n                        <span class="ml-1">add data</span>\n                      </b-button>\n                      <b-button\n                        :to="`/dataset${data.item.name}/info`"\n                        variant="primary"\n                        class="mr-0 mb-md-0 d-block d-md-inline-block">\n                        <FontAwesomeIcon icon="tachometer-alt" />\n                        <span class="ml-1">info</span>\n                      </b-button>\n                    </template>\n                  </table-listing>\n                </b-col>\n              </b-row>\n           </div>\n          </b-card-body>\n        </b-card>\n      </b-col>\n    </b-row>\n  </b-container>\n</template>\n\n<script>\nimport Menu from \'@/components/manage/Menu\'\nimport listDatasets from \'@/mixins/list-datasets\'\nimport TableListing from \'@/components/dataset/TableListing\'\nimport { library } from \'@fortawesome/fontawesome-svg-core\'\nimport { faTimesCircle, faDownload, faTachometerAlt } from \'@fortawesome/free-solid-svg-icons\'\nimport { FontAwesomeIcon } from \'@fortawesome/vue-fontawesome\'\n\nlibrary.add(faTimesCircle, faDownload, faTachometerAlt)\n\nexport default {\n  name: \'ManageExistingDatasets\',\n\n  mixins: [\n    listDatasets\n  ],\n\n  data () {\n    return {\n      currentPopover: null\n    }\n  },\n\n  components: {\n    FontAwesomeIcon,\n    Menu,\n    \'table-listing\': TableListing\n  },\n\n  methods: {\n    async deleteDataset (datasetName) {\n      await this.$fusekiService.deleteDataset(datasetName)\n      this.$bvToast.toast(`Dataset ${datasetName} deleted`, {\n        title: \'Notification\',\n        autoHideDelay: 5000,\n        appendToast: false\n      })\n      this.initializeData()\n    },\n    async backupDataset (datasetName) {\n      const response = await this.$fusekiService.backupDataset(datasetName)\n      const taskId = response.data.taskId\n      this.$bvToast.toast(`Backup task ${taskId} scheduled. Click on tasks for more.`, {\n        title: \'Notification\',\n        autoHideDelay: 5000,\n        appendToast: false\n      })\n      this.initializeData()\n    },\n    hidePopover (id) {\n      this.$root.$emit(\'bv::hide::popover\', id)\n    },\n    showPopover (id) {\n      if (this.currentPopover !== null) {\n        this.$root.$emit(\'bv::hide::popover\', this.currentPopover)\n      }\n      this.$root.$emit(\'bv::show::popover\', id)\n      this.currentPopover = id\n    }\n  }\n}\n<\/script>\n']},_coverageSchema:"1a1c01bbd47fc00a2c39e90264f33305004495a9",hash:"5c8b217018d3ab58af726bb042a99849d4f103ae"},s=n[a]||(n[a]={});s[e]&&s[e].hash===t||(s[e]=o);var i=s[e];return p=function(){return i},i}p(),p().s[0]++,d.vI.add(u.nYk,u.q7m,u.HLz);var A={name:"ManageExistingDatasets",mixins:[l.Z],data:function(){return p().f[0]++,p().s[1]++,{currentPopover:null}},components:{FontAwesomeIcon:b.GN,Menu:c.Z,"table-listing":m.Z},methods:{deleteDataset:function(e){var t=this;return(0,s.Z)(r().mark((function n(){return r().wrap((function(n){while(1)switch(n.prev=n.next){case 0:return p().f[1]++,p().s[2]++,n.next=4,t.$fusekiService.deleteDataset(e);case 4:p().s[3]++,t.$bvToast.toast("Dataset ".concat(e," deleted"),{title:"Notification",autoHideDelay:5e3,appendToast:!1}),p().s[4]++,t.initializeData();case 8:case"end":return n.stop()}}),n)})))()},backupDataset:function(e){var t=this;return(0,s.Z)(r().mark((function n(){var a,o;return r().wrap((function(n){while(1)switch(n.prev=n.next){case 0:return p().f[2]++,p().s[5]++,n.next=4,t.$fusekiService.backupDataset(e);case 4:a=n.sent,p().s[6]++,o=a.data.taskId,p().s[7]++,t.$bvToast.toast("Backup task ".concat(o," scheduled. Click on tasks for more."),{title:"Notification",autoHideDelay:5e3,appendToast:!1}),p().s[8]++,t.initializeData();case 10:case"end":return n.stop()}}),n)})))()},hidePopover:function(e){p().f[3]++,p().s[9]++,this.$root.$emit("bv::hide::popover",e)},showPopover:function(e){p().f[4]++,p().s[10]++,null!==this.currentPopover?(p().b[0][0]++,p().s[11]++,this.$root.$emit("bv::hide::popover",this.currentPopover)):p().b[0][1]++,p().s[12]++,this.$root.$emit("bv::show::popover",e),p().s[13]++,this.currentPopover=e}}},v=A,f=n(1001),h=(0,f.Z)(v,a,o,!1,null,null,null),k=h.exports}}]);
//# sourceMappingURL=manageDatasets-legacy.89b274cd.js.map