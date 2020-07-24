/*
 * Copyright (C) 2020 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef _BDROID_BUILDCFG_H
#define _BDROID_BUILDCFG_H

#include <cutils/properties.h>
#include <string.h>

#include "osi/include/osi.h"

typedef struct {
    const char *product_device;
    const char *product_model;
} device_t;

static const device_t devices[] = {
    {"HW6250", "HI6250"},
    {"HWANE", "Huawei P20 Lite"},
    {"HWALN", "Honor 6X"},
    {"HWBND", "Honor 7X"},
    {"HWDLS", "Huawei Enjoy 7S"},
    {"HWFIG", "Huawei P Smart 2018"},
    {"HWLLD", "Honor 9 Lite"},
    {"HWPRA", "Honor 8 Lite"},
    {"HWPRA", "Huawei P8 Lite 2017"},
    {"HWPRA", "Huawei P9 Lite 2017"},
    {"HWRNE", "Huawei Mate 10 Lite"},
    {"HWWAR", "Huawei P10 Lite"},
};

static inline const char *BtmGetDefaultName()
{
    char product_device[PROPERTY_VALUE_MAX];
    property_get("ro.product.device", product_device, "");

    for (unsigned int i = 0; i < ARRAY_SIZE(devices); i++) {
        device_t device = devices[i];

        if (strcmp(device.product_device, product_device) == 0) {
            return device.product_model;
        }
    }

    // Fallback to ro.product.model
    return "";
}

#define BTM_DEF_LOCAL_NAME BtmGetDefaultName()
#define BTM_BYPASS_EXTRA_ACL_SETUP TRUE

#define BLE_INCLUDED TRUE
#define BLE_VND_INCLUDED TRUE

#undef PROPERTY_VALUE_MAX

#endif
