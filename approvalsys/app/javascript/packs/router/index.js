import Vue from 'vue'
import VueRouter from 'vue-router'
import Hello from '../components/Hello'
import Sample from '../components/Sample'

import DashboardV1 from '../examples/Dashboard.v1'
import DashboardV2 from '../examples/Dashboard.v2'
import InfoBoxExample from '../examples/InfoBoxExample'
import ChartExample from '../examples/ChartExample'
import AlertExample from '../examples/AlertExample'
import ModalExample from '../examples/ModalExample'
import WidgetsExample from '../examples/WidgetsExample'
import APIExample from '../examples/APIExample'

// UI Element Groups
import General from '../pages/ui-elements/General'
import Icons from '../pages/ui-elements/Icons'
import Buttons from '../pages/ui-elements/Buttons'
import Sliders from '../pages/ui-elements/Sliders'
import Timeline from '../pages/ui-elements/Timeline'
import Modals from '../pages/ui-elements/Modals'

// forms
import GeneralElements from '../pages/forms/GeneralElements'
import AdvancedElements from '../pages/forms/AdvancedElements'

// start of Appl
import ApplIndex from '../../views/appl/index'
import ApplEdit from '../../views/appl/edit'
import ApplNew from '../../views/appl/new'
// start of User
import UserIndex from '../../views/user/index'
import UserEdit from '../../views/user/edit'
import UserNew from '../../views/user/new'
// start of Role
import RoleIndex from '../../views/role/index'
import RoleEdit from '../../views/role/edit'
import RoleNew from '../../views/role/new'
//<%=import_router_component%>



Vue.use(VueRouter)

export default new VueRouter({
    mode: 'history',
    routes: [
        //<%=router_item%>
        // start of Role
        {
            path: '/vue/index/#/role/index',
            name: 'RoleIndex',
            component: RoleIndex
        },

        {
            path: '/vue/index/#/role/new',
            name: 'RoleNew',
            component: RoleNew
        },

        {
            path: '/vue/index/#/role/:id/edit',
            name: 'RoleEdit',
            component: RoleEdit
        },

        // start of User
        {
            path: '/vue/index/#/user/index',
            name: 'UserIndex',
            component: UserIndex
        },

        {
            path: '/vue/index/#/user/new',
            name: 'UserNew',
            component: UserNew
        },

        {
            path: '/vue/index/#/user/:id/edit',
            name: 'UserEdit',
            component: UserEdit
        },

        // start of Appl
        {
            path: '/vue/index/#/appl/index',
            name: 'ApplIndex',
            component: ApplIndex
        },

        {
            path: '/vue/index/#/appl/new',
            name: 'ApplNew',
            component: ApplNew
        },

        {
            path: '/vue/index/#/appl/:id/edit',
            name: 'ApplEdit',
            component: ApplEdit
        },

        {
            path: '/vue/index/hello2',
            name: 'Hello',
            component: Hello
        },
        {
            path: '/vue/index/sample',
            name: 'Sample',
            component: Sample
        },
        {
            path: '/vue/index/dashboard/v1',
            name: 'DashboardV1',
            component: DashboardV1
        },
        {
            path: '/vue/index/dashboard/v2',
            name: 'DashboardV2',
            component: DashboardV2
        },
        {
            path: '/vue/index/examples/infobox',
            name: 'InfoBoxExample',
            component: InfoBoxExample
        },
        {
            path: '/vue/index/examples/chart',
            name: 'ChartExample',
            component: ChartExample
        },
        {
            path: '/vue/index/examples/alert',
            name: 'AlertExample',
            component: AlertExample
        },
        {
            path: '/vue/index/examples/modal',
            name: 'ModalExample',
            component: ModalExample
        },
        {
            path: '/vue/index/examples/widgets',
            name: 'WidgetsExample',
            component: WidgetsExample
        },
        {
            path: '/vue/index/examples/api-example',
            name: 'APIExample',
            component: APIExample
        },
        {
            path: '/vue/index/ui-elements/general',
            name: 'General',
            component: General
        },
        {
            path: '/vue/index/ui-elements/icons',
            name: 'Icons',
            component: Icons
        },
        {
            path: '/vue/index/ui-elements/buttons',
            name: 'Buttons',
            component: Buttons
        },
        {
            path: '/vue/index/ui-elements/sliders',
            name: 'Sliders',
            component: Sliders
        },
        {
            path: '/vue/index/ui-elements/timeline',
            name: 'Timeline',
            component: Timeline
        },
        {
            path: '/vue/index/ui-elements/modals',
            name: 'Modals',
            component: Modals
        },
        {
            path: '/vue/index/forms/general-elements',
            name: 'GeneralElements',
            component: GeneralElements
        },
        {
            path: '/vue/index/forms/advanced-elements',
            name: 'AdvancedElements',
            component: AdvancedElements
        }

    ],
    linkActiveClass: 'active'
})
