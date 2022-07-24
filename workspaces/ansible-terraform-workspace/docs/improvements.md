# Improvements

## Fix non-standard port 9000 for terraform-rover

use socat. 

Install 

```
apt-get install -y socat
```

Create tunnel between port 9000 and 8033

```
socat tcp-listen:8033,reuseaddr,fork tcp:localhost:9000
```

Add this to supervisord