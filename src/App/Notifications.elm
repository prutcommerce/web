port module App.Notifications exposing (displayNotification, updateSharedState, updates)


port displayNotification : String -> Cmd msg


port updateSharedState : () -> Cmd msg


port updates : (String -> msg) -> Sub msg
