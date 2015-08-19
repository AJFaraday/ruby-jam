module Game

  class Controller

    def initialize
      @usb_context = LIBUSB::Context.new
      @device = @usb_context.devices(
        idVendor: 1356, idProduct: 2
      ).first
      reset_device_access
      @handle = @device.open
    end

    def raw_data
      @handle.interrupt_transfer(
        :endpoint => 0x81,
        :dataIn => 0x0008,
        :timeout => 10
      )
    end

    def reset_device_access
      device = @usb_context.devices(
        idVendor: 1356, idProduct: 2
      ).first
      handle = device.open
      handle.detach_kernel_driver(0)
      handle.close
    rescue => er
      puts er.message
      # nothing needs doing here
    end


    def update
      puts raw_data.bytes.to_a.inspect
    rescue
      # no input, just ignore the error
    end

  end

end