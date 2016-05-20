require 'dbus'

class NotifySend

 	@@interface = nil
	DEFAULTS = {
		app_name: __FILE__,
		id:       0,
		icon:     'info',
		summary:  '',
		body:     '',
		actions:  [],
		hints:    {},
		timeout:  2000
	}

	def self.send(first, *others)
		if first.is_a?(Hash) and others.length == 0
			_send first
		elsif first.respond_to?(:to_s) and others.length < 4
			_send [:body, :icon, :timeout].zip(others).each_with_object({summary: first}) { |(k, v), obj| obj[k] = v unless v.nil? }
		else
			raise ArgumentError.new("Invalid arguments")
		end
		# _send DEFAULTS.merge(first.is_a?(Hash) ? first : {summary: first, body: others[0]})
	end

	private

	def self.interface
		@@interface ||= get_interface
	end

	def self.get_interface
		bus = DBus::SessionBus.instance
		obj = bus.service("org.freedesktop.Notifications").object "/org/freedesktop/Notifications"
		obj.introspect
		obj["org.freedesktop.Notifications"]
	end

	def self._send(params)
		interface.Notify *DEFAULTS.merge(params).values
	end
	
end
