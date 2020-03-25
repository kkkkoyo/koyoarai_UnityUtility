using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class DeviceInfoModel : MonoBehaviour
{

    /// <summary>
    /// ノッチがあるデバイスかどうか判定
    /// </summary>
    /// <returns>ノッチがあるデバイスかどうか</returns>
    public static bool hasNotchDevice() 
    {
#if UNITY_EDITOR
        bool isEditorDeviceHasNotchDecision = false;
        return isEditorDeviceHasNotchDecision;
#else
        return !(Screen.height == Screen.safeArea.height);
#endif
    }
}


