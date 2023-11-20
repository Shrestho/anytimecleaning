import React from 'react'
import {ComponentPreview, Previews} from '@react-buddy/ide-toolbox'
import {PaletteTree} from './palette'
import UserSignup from "../app/pages/Authentication/User/UserSignup";
import AllRoutes from "../routes/AllRoutes";
import ConfirmBooking from '../app/components/Booking/ConfirmBooking';

const ComponentPreviews = () => {
    return (
        <Previews palette={<PaletteTree/>}>
            <ComponentPreview path="/ConfirmBooking">
                <ConfirmBooking/>
            </ComponentPreview>
            <ComponentPreview path="/UserSignup">
                <UserSignup/>
            </ComponentPreview>
            <ComponentPreview path="/AllRoutes">
                <AllRoutes/>
            </ComponentPreview>
        </Previews>
    )
}

export default ComponentPreviews