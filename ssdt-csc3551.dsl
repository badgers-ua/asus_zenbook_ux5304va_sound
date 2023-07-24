DefinitionBlock ("", "SSDT", 1, "CUSTOM", "CSC3551", 0x00000002)
{
    External (_SB_.GPI0, DeviceObj)
    External (_SB_.PC00.SPI1, DeviceObj)

    Scope (\_SB.PC00.SPI1)
    {
        Device (SPK1)
        {
            Name (_HID, "CSC3551")  // _HID: Hardware ID
            Name (_SUB, "104316D3")  // _SUB: Subsystem ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (SBUF, ResourceTemplate ()
                {
                    SpiSerialBusV2 (0x0000, PolarityLow, FourWireMode, 0x08,
                        ControllerInitiated, 0x003D0900, ClockPolarityLow,
                        ClockPhaseFirst, "\\_SB.PC00.SPI1",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    SpiSerialBusV2 (0x0001, PolarityLow, FourWireMode, 0x08,
                        ControllerInitiated, 0x003D0900, ClockPolarityLow,
                        ClockPhaseFirst, "\\_SB.PC00.SPI1",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GPI0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0017
                        }
                    GpioIo (Exclusive, PullDown, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GPI0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0131
                        }
                    GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionInputOnly,
                        "\\_SB.GPI0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x012E
                        }
                    GpioIo (Shared, PullUp, 0x0064, 0x0000, IoRestrictionInputOnly,
                        "\\_SB.GPI0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x012F
                        }
                    GpioInt (Edge, ActiveBoth, Shared, PullUp, 0x0064,
                        "\\_SB.GPI0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x012F
                        }
                })
                Return (SBUF) /* \_SB_.PC00.SPI1.SPK1._CRS.SBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
            }

            Method (_DSD, 0, NotSerialized)  // _DSD: Device Specific Data
            {
                Return (Package ()
                    {
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package ()
                        {
                            Package () { "cirrus,dev-index", Package () { Zero, One }},
                            Package () { "reset-gpios", Package () {
                            SPK1, One, Zero, Zero,
                            SPK1, One, Zero, Zero
                            } },
                            Package () { "spk-id-gpios", Package () {
                                SPK1, 0x02, Zero, Zero,
                                SPK1, 0x02, Zero, Zero,
                            } },
                            Package () { "cirrus,speaker-position", Package () { Zero, One } },
                            Package () { "cirrus,gpio1-func", Package () { One, One } },
                            Package () { "cirrus,gpio2-func", Package () { 0x02, 0x02 } },
                            // boost-type: 0 internal, 1 external
                            Package () { "cirrus,boost-type", Package () { One, One } },
                            // boost-peak-milliamp: 1600 to 4500, increments of 50 mA
                            //Package () { "cirrus,boost-peak-milliamp",  Package () { 3000, 3000 } },
                            // boost-ind-nanohenry: 1000 | 1200 | 1500 | 2200 nH
                            //Package () { "cirrus,boost-ind-nanohenry",  Package () { 1000, 1000 } },
                            // boost-cap-microfarad: rounded to the nearest integer
                            //Package () { "cirrus,boost-cap-microfarad", Package () { 15, 15 } },
                        }
                    }) /* \_SB_.PC00.SPI0.SPK1._DSD */
            }
        }

        Method (_DSD, 0, NotSerialized)  // _DSD: Device Specific Data
        {
            Return (Package ()
                {
                    ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                    Package ()
                    {
                        Package () { "cs-gpios", Package () { 
                            Zero,                    // Native CS
                            SPK1, Zero, Zero, Zero   // GPIO CS
                        } }
                    }
                }) /* \_SB_.PC00.SPI0.SPK1._DSD */
        }
    }
}

