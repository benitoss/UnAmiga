#include <iostream>
#include <getopt.h>

#include "binaryblob.h"

using namespace std;

enum ROM_RemapType {REMAP_NONE,REMAP_ABBC,REMAP_ABCC};

class ROM : public BinaryBlob
{
	public:
	ROM(const char *filename) : BinaryBlob(filename)
	{
	}
	ROM(int size) : BinaryBlob(size)
	{
	}
	// Given a mapping string of the form "ABABC", return the value of the highest symbol found.
	// (Y and Z are reserved for one-filled and zero-filled blocks, respectively.
	virtual int CountMapChunks(const char *mapstr)
	{
		int highest=0;
		char c;
		while((c=*mapstr++))
		{
			c&=~32; // Force uppercase
			if((c>highest) && (c<'Y'))
				highest=c;
		}
		highest-='@';	// Return 1 for 'A', 2 for 'B', etc.
		return(highest);
	}

	virtual ROM *Remap(const char *map)
	{
		ROM *result=0;
		const unsigned char *src=GetPointer();
		unsigned char *dst;
		int srcsize=GetSize();
		int dstsize;
		int chunksize;
		Debug[TRACE] << "ROM size before header stripping: " << srcsize << std::endl;
		if(srcsize&512)	// Strip header if present.
			src+=512;
		srcsize&=~512;
		Debug[TRACE] << "ROM size after header stripping: " << srcsize << std::endl;

		int mapchunks=CountMapChunks(map);
		chunksize=srcsize/mapchunks;
		dstsize=strlen(map)*chunksize;
		Debug[TRACE] << "Mapping uses " << mapchunks << " chunks, giving a chunk size of " << chunksize << std::endl;

		Debug[TRACE] << "Destsize: " << dstsize << std::endl;
		result=new ROM(dstsize);
		dst=result->GetPointer();

		char c;
		while(c=*map++)
		{
			c&=~32;
			switch(c)
			{
				case 'Y': // one-filled block
					Debug[TRACE] << "Writing a one-filled block" << std::endl;
					memset(dst,0xff,chunksize);
					break;
				case 'Z': // zero-filled block
					Debug[TRACE] << "Writing a zero-filled block" << std::endl;
					memset(dst,0,chunksize);
					break;
				default: // Regular block.
					c-='A';
					Debug[TRACE] << "Copying chunk at " << c*chunksize << std::endl;
					memcpy(dst,src+c*chunksize,chunksize);
					break;
			}

			dst+=chunksize;

		}
		return(result);
	}
	virtual ~ROM()
	{
	}

	protected:
};

class ROMMap_Options
{
	public:
	ROMMap_Options(int argc,char *argv[])
	{
		static struct option long_options[] =
		{
			{"help",no_argument,NULL,'h'},
			{"mapping",required_argument,NULL,'m'},
			{"outfile",required_argument,NULL,'o'},
			{"debug",required_argument,NULL,'d'},
			{0, 0, 0, 0}
		};
		outfile=0;
		mapping=0;
		while(1)
		{
			int c;
			c = getopt_long(argc,argv,"hm:o:d:",long_options,NULL);
			if(c==-1)
				break;
			switch (c)
			{
				case 'h':
					printf("Usage: %s [options]\n",argv[0]);
					printf("    -h --help\t\tdisplay this message\n");
					printf("    -m --mapping\tSpecify a ROM mapping in the format ABABCYZ\n");
					printf("    -o --outfile\tspecify output filename.\n");
					printf("    -d --debug\tspecify debug level - 0 to 5\n");
					break;
				case 'd':
					Debug.SetLevel(DebugLevel(atoi(optarg)));
					break;
				case 'o':
					outfile=optarg;
					break;
				case 'm':
					mapping=optarg;
					break;
			}
		}
	}
	~ROMMap_Options()
	{
	}
	const char *mapping;
	const char *outfile;
};


int main(int argc,char **argv)
{
	try
	{
		ROMMap_Options opts(argc,argv);
		if(optind<argc)
		{
			Debug[TRACE] << "Loading ROM" << std::endl;
			ROM rom(argv[optind]);
			Debug[TRACE] << "Remapping ROM" << std::endl;
			ROM *out=rom.Remap(opts.mapping);
			if(out && opts.outfile)
			{
				out->Save(opts.outfile);
			}
		}
	}
	catch(const char *err)
	{
		Debug[ERROR]<<err<<std::endl;
	}
	return(0);
}

