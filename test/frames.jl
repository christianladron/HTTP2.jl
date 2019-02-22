using HTTP2.Frame

@test decode(IOBuffer(encode(ContinuationFrame(false, 0x51, b"test")))) ==
    ContinuationFrame(false, 0x51, b"test")
@test decode(IOBuffer(encode(DataFrame(0x51, false, b"test")))) ==
    DataFrame(0x51, false, b"test")
@test decode(IOBuffer(encode(GoawayFrame(0x4f, 0x4, b"test")))) ==
    GoawayFrame(0x4f, 0x4, b"test")
@test decode(IOBuffer(encode(HeadersFrame(false, false, true, 0x51,
                                          false, 0x50,
                                          0x1, b"test")))) ==
                                              HeadersFrame(false, false, true, 0x51,
                                                           false, 0x50,
                                                           0x1, b"test")
@test decode(IOBuffer(encode(PingFrame(false, b"testtest")))) ==
    PingFrame(false, b"testtest")
@test decode(IOBuffer(encode(PriorityFrame(0x51, false, 0x50, 0x2)))) ==
    PriorityFrame(0x51, false, 0x50, 0x2)
@test decode(IOBuffer(encode(PushPromiseFrame(false, 0x51, 0x54, b"test")))) ==
    PushPromiseFrame(false, 0x51, 0x54, b"test")
@test decode(IOBuffer(encode(RstStreamFrame(0x51, 0x4)))) ==
    RstStreamFrame(0x51, 0x4)
@test decode(IOBuffer(encode(SettingsFrame(true, nothing)))) == SettingsFrame(true, nothing)
@test decode(IOBuffer(encode(WindowUpdateFrame(0x51, 0x2)))) ==
    WindowUpdateFrame(0x51, 0x2)
