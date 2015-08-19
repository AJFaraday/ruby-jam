module Game

  # buzzer | byte  | value | bit
  # 1      |  2    |  1    |  0
  # 2      |  2    |  32   |  5
  # 3      |  3    |  4    |  2
  # 4      |  3    |  128  |  7

  class Controller

    BUZZ_BYTES = [
      [2, 0],
      [2, 5],
      [3, 2],
      [3, 7]
    ]

    def initialize(window)
      @window = window
      @usb_context = LIBUSB::Context.new
      @device = @usb_context.devices(
        idVendor: 1356, idProduct: 2
      ).first
      reset_device_access
      @handle = @device.open
    end

    def raw_data
      data = @handle.interrupt_transfer(
        :endpoint => 0x81,
        :dataIn => 0x0008,
        :timeout => 10
      )
      data.bytes.to_a
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
      data = raw_data
      BUZZ_BYTES.each_with_index do |lookup, i|
        if data[lookup[0]][lookup[1]] == 1
          puts "buzzer #{i + 1} pushed"
          @window.panellists[i].buzz
        end
      end
    rescue => er
      # no input, just ignore the error
    end

  end

end